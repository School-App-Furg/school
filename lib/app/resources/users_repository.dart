import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../core/models/management_user.dart';
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
            json.encode(snapshot.data()),
          );
        },
      );
    } catch (error) {
      throw Exception(error);
    }
    return model;
  }

  //Cadastro de um gestor
  Future<bool> insertManagement(
      String userId, ManagementUser managementUser) async {
    return await firestoreInstance.collection('users').doc(userId).set({
      'schoolId': managementUser.schoolId,
      'name': managementUser.name,
      'type': managementUser.type
    }).then(
      (value) {
        return true;
      },
    ).catchError((error) => throw Exception(error));
  }

  //Retorna as informações de um gestor
  Future<ManagementUser?> getUserManagementById(String userId) async {
    ManagementUser? model;
    try {
      await firestoreInstance.collection('users').doc(userId).get().then(
        (DocumentSnapshot snapshot) {
          model = ManagementUser.fromJson(
            json.encode(snapshot.data()),
          );
        },
      );
    } catch (error) {
      throw Exception(error);
    }
    return model;
  }

  //Cadastro de um professor
  Future insertTeacher(String userId, TeacherUser teacherUser) async {
    return await firestoreInstance.collection('users').doc(userId).set({
      'schoolId': teacherUser.schoolId,
      'name': teacherUser.name,
      'type': teacherUser.type
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
              type: teste.type);
        },
      );
    } catch (error) {
      throw Exception(error);
    }
    return model;
  }

  //Cadastro de um aluno/responsavel
  Future<bool> insertStudent(String userId, StudentUser studentUser) async {
    return await firestoreInstance.collection('users').doc(userId).set({
      'schoolId': studentUser.schoolId,
      'name': studentUser.name,
      'type': studentUser.type
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
          .where('type', isEqualTo: 3)
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
              type: lista.type));
        },
      );
    } catch (error) {
      throw Exception(error);
    }
    return list;
  }

  //Retorna o do usuário(0 = admin,1=gestor,2=professor,3=aluno)
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
