import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../core/models/student_user.dart';
import '../core/models/teacher_user.dart';
import '../core/models/user_admin.dart';

class UsersRepository {
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  //Cadastro de usuário admin escola
  Future<bool> insertUserAdmin(String id, UserAdmin userAdmin) async {
    return await firestoreInstance.collection('users').doc(id).set({
      'schoolId': userAdmin.schoolId,
      'name': userAdmin.name,
      'type': userAdmin.type
    }).then(
      (value) {
        return true;
      },
    ).catchError((error) => throw Exception(error));
  }

  //Retorna as informações do user admin
  Future<UserAdmin?> getUserAdminById(String userId) async {
    UserAdmin? model;
    try {
      await firestoreInstance.collection('users').doc(userId).get().then(
        (DocumentSnapshot snapshot) {
          model = UserAdmin.fromJson(
            json.encode(
              snapshot.data(),
            ),
          );
        },
      );
    } catch (error) {
      throw Exception(error);
    }
    return model;
  }

  //Retorna os estudantes de uma turma
  Future<List<StudentUser>> getStudentsForClass(List list) async {
    try {
      List<StudentUser> data = [];
      QuerySnapshot<Map<String, dynamic>> snapshot = await firestoreInstance
          .collection('users')
          .where(FieldPath.documentId, whereIn: list)
          .get();
      snapshot.docs.forEach(
        (element) {
          data.add(
            StudentUser.fromJson(
              json.encode(
                element.data(),
              ),
            ),
          );
        },
      );
      return data;
    } catch (error) {
      throw Exception(error);
    }
  }

  //Cadastro de um professor
  Future insertTeacher(String userId, TeacherUser teacherUser) async {
    return await firestoreInstance.collection('users').doc(userId).set({
      'schoolId': teacherUser.schoolId,
      'name': teacherUser.name,
      'type': teacherUser.type,
      'subjects': teacherUser.subjects,
      'cpf': teacherUser.cpf
    }).then(
      (value) {
        return true;
      },
    ).catchError((error) => throw Exception(error));
  }

  //Retorna as informações de um professor
  Future<TeacherUser?> getUserTeacherById(String userId) async {
    TeacherUser? model;
    try {
      await firestoreInstance.collection('users').doc(userId).get().then(
        (DocumentSnapshot snapshot) {
          var teste = TeacherUser.fromJson(
            json.encode(snapshot.data()),
          );
          model = TeacherUser(
              id: snapshot.id,
              schoolId: teste.schoolId,
              name: teste.name,
              type: teste.type,
              subjects: teste.subjects,
              cpf: teste.cpf);
        },
      );
    } catch (error) {
      throw Exception(error);
    }
    return model;
  }

  //Retorna as informações de um professor
  Future<StudentUser?> getUserStudentById(String userId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await firestoreInstance.collection('users').doc(userId).get();
      var data = StudentUser.fromJson(
        json.encode(snapshot.data()),
      );
      return StudentUser(
          id: snapshot.id,
          schoolId: data.schoolId,
          name: data.name,
          type: data.type,
          cpf: data.cpf);
    } catch (error) {
      throw Exception(error);
    }
  }

  //Retorna uma lista de professores
  Future<List<TeacherUser>> getTeachers(String schoolId) async {
    List<TeacherUser>? list = [];
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await firestoreInstance
          .collection('users')
          .where('schoolId', isEqualTo: schoolId)
          .where('type', isEqualTo: 1)
          .get();
      snapshot.docs.forEach(
        (element) {
          var teste = TeacherUser.fromJson(
            json.encode(
              element.data(),
            ),
          );
          list.add(
            TeacherUser(
                id: element.id,
                name: teste.name,
                schoolId: teste.schoolId,
                type: teste.type,
                cpf: teste.cpf,
                subjects: teste.subjects),
          );
        },
      );
    } catch (error) {
      throw Exception(error);
    }
    return list;
  }

  //editar professor
  Future<bool> updateTeacher(TeacherUser teacherUser) async {
    return await firestoreInstance
        .collection('users')
        .doc(teacherUser.id)
        .update(
      {'name': teacherUser.name, 'subjects': teacherUser.subjects},
    ).then(
      (value) {
        return true;
      },
    ).catchError(
      (error) => throw Exception(error),
    );
  }

  //editar aluno
  Future<bool> updateStudent(StudentUser studentUser) async {
    return await firestoreInstance
        .collection('users')
        .doc(studentUser.id)
        .update(
      {
        'name': studentUser.name,
      },
    ).then(
      (value) {
        return true;
      },
    ).catchError(
      (error) => throw Exception(error),
    );
  }

  //Cadastro de um aluno/responsavel
  Future<bool> insertStudent(String userId, StudentUser studentUser) async {
    return await firestoreInstance.collection('users').doc(userId).set({
      'schoolId': studentUser.schoolId,
      'name': studentUser.name,
      'type': studentUser.type,
      'cpf': studentUser.cpf
    }).then(
      (value) {
        return true;
      },
    ).catchError((error) => throw Exception(error));
  }

  //Retorna as informações de um aluno
  Future<StudentUser?> getStudentById(String userId) async {
    StudentUser? model;
    try {
      await firestoreInstance.collection('users').doc(userId).get().then(
        (DocumentSnapshot snapshot) {
          model = StudentUser.fromJson(
            json.encode(snapshot.data()),
          );
        },
      );
    } catch (error) {
      throw Exception(error);
    }
    return model;
  }

  //Retorna a listagem de alunos de uma escola
  Future<List<StudentUser>> getStudentsBySchoolId(String schoolId) async {
    List<StudentUser> list = [];
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await firestoreInstance
          .collection('users')
          .where('schoolId', isEqualTo: schoolId)
          .where('type', isEqualTo: 2)
          .get();
      snapshot.docs.forEach(
        (element) {
          var lista = StudentUser.fromJson(
            json.encode(
              element.data(),
            ),
          );
          list.add(StudentUser(
              id: element.id,
              schoolId: lista.schoolId,
              name: lista.name,
              type: lista.type,
              cpf: lista.cpf));
        },
      );
    } catch (error) {
      throw Exception(error);
    }
    return list;
  }

  //Retorna o do usuário(0 = admin,1=professor,2=aluno)
  Future<int> getUserType(String userId) async {
    try {
      DocumentSnapshot documentSnapshot =
          await firestoreInstance.collection('users').doc(userId).get();
      if (documentSnapshot.exists) {
        dynamic data = documentSnapshot.get('type');
        if (data != null) {
          return data;
        }
      }
    } catch (error) {
      throw Exception(error);
    }
    return -1;
  }
}
