import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

import '../core/models/classes.dart';
import '../core/models/subject_teacher.dart';

class ClassesRepository {
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  //Retorna a lista de turmas cadastrada em uma determinada escola
  Future<ObservableList<Classes>?> getClassesBySchoolId(
      String id, String cycle) async {
    ObservableList<Classes>? list = ObservableList<Classes>();
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await firestoreInstance
          .collection('classes')
          .where('schoolId', isEqualTo: id)
          .where('cycleId', isEqualTo: cycle)
          .get();
      snapshot.docs.forEach(
        (element) async {
          Classes turma = Classes.fromJson(
            json.encode(
              element.data(),
            ),
          );
          list.add(
            Classes(
                id: element.id,
                schoolId: turma.cycleId,
                name: turma.name,
                room: turma.room,
                cycleId: turma.cycleId,
                level: turma.level,
                students: turma.students),
          );
        },
      );
    } catch (error) {
      throw Exception(error);
    }
    return list;
  }

  //retorna a lista de disciplinas e o seu professor cadastrado de cada turma
  Future<List<SubjectTeacher>> getSubjectTeacher(String? id) async {
    List<SubjectTeacher>? list = [];
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await firestoreInstance
          .collection('classes')
          .doc(id)
          .collection('subjectTeacher')
          .get();
      snapshot.docs.forEach(
        (element) async {
          SubjectTeacher teste = SubjectTeacher.fromJson(
            json.encode(
              element.data(),
            ),
          );
          list.add(
            SubjectTeacher(
                id: element.id,
                idSubject: teste.idSubject,
                idTeacher: teste.idTeacher,
                subject: teste.subject,
                teacher: teste.teacher),
          );
        },
      );
    } catch (error) {
      throw Exception(error);
    }
    return list;
  }

  //cadastro de turmas
  Future<String> insertClass(Classes classe) async {
    try {
      DocumentReference<Map<String, dynamic>> classeCadastrada =
          await firestoreInstance.collection('classes').add(classe.toMap());
      return classeCadastrada.id;
    } catch (e) {
      throw Exception(e);
    }
  }

  //cadastro da subclasse Subject teacher
  Future<bool> insertSubjectTeacher(
      SubjectTeacher subjectTeacher, String doc) async {
    try {
      await firestoreInstance
          .collection('classes')
          .doc(doc)
          .collection('subjectTeacher')
          .add(subjectTeacher.toMap());
      return true;
    } catch (e) {
      throw Exception(e);
    }
  }

  //editar uma turma
  Future<bool> updateClass(Classes classe) async {
    try {
      await firestoreInstance.collection('classes').doc(classe.id).update({
        'name': classe.name,
        'room': classe.room,
        'level': classe.level,
        'students': classe.students
      });
      return true;
    } catch (e) {
      throw Exception(e);
    }
  }

  //cadastro da subclasse Subject teacher
  Future<bool> deleteSubjectTeacher(
      SubjectTeacher subjectTeacher, String doc) async {
    try {
      await firestoreInstance
          .collection('classes')
          .doc(doc)
          .collection('subjectTeacher')
          .doc(subjectTeacher.id)
          .delete();
      return true;
    } catch (e) {
      throw Exception(e);
    }
  }

  //cadastro da subclasse Subject teacher
  Future<bool> deleteClass(String idClass) async {
    try {
      await firestoreInstance.collection('classes').doc(idClass).delete();
      return true;
    } catch (e) {
      throw Exception(e);
    }
  }
}
