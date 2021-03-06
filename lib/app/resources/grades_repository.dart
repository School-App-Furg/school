import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

import '../core/models/grade.dart';

class GradesRepository {
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  //Retorna a lista de disciplinas cadastradas em uma determinada escola
  Future<List<Grade>> getGrades(
      String studentId, String cycleId, String classId) async {
    final List<Grade> list = [];
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await firestoreInstance
              .collection('grades')
              .where('student', isEqualTo: studentId)
              .where('cycle', isEqualTo: cycleId)
              .where('classe', isEqualTo: classId)
              .get();
      for (final element in snapshot.docs) {
        list.add(
          Grade.fromJson(
            json.encode(
              element.data(),
            ),
          ),
        );
      }
      return list;
    } catch (error) {
      throw Exception(error);
    }
  }

  //Retorna a lista de disciplinas com base em uma determinada disciplina
  Future<List<Grade>> getGradesForSubject(
      String studentId, String cycleId, String subject) async {
    final List<Grade> list = [];
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await firestoreInstance
              .collection('grades')
              .where('student', isEqualTo: studentId)
              .where('cycle', isEqualTo: cycleId)
              .where('subject', isEqualTo: subject)
              .get();
      for (final element in snapshot.docs) {
        list.add(
          Grade.fromJson(
            json.encode(
              element.data(),
            ),
          ),
        );
      }
      return list;
    } catch (error) {
      throw Exception(error);
    }
  }

  //Retorna a lista de disciplinas cadastradas com base em um professor
  Future<ObservableList<Grade>> getGradesForTeacher(
      List<String> students,
      String cycleId,
      String idSubject,
      String idTeacher,
      String classId) async {
    final ObservableList<Grade> list = ObservableList();
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await firestoreInstance
              .collection('grades')
              .where('student', whereIn: students)
              .where('cycle', isEqualTo: cycleId)
              .where('subject', isEqualTo: idSubject)
              .where('teacher', isEqualTo: idTeacher)
              .where('classe', isEqualTo: classId)
              .orderBy('timeCourse')
              .get();
      for (final element in snapshot.docs) {
        final data = Grade.fromJson(
          json.encode(
            element.data(),
          ),
        );
        list.add(
          Grade(
              id: element.id,
              student: data.student,
              cycle: data.cycle,
              subject: data.subject,
              note: data.note,
              timeCourse: data.timeCourse,
              faults: data.faults,
              teacher: data.teacher,
              classe: data.classe),
        );
      }
      return list;
    } catch (error) {
      throw Exception(error);
    }
  }

  //insere uma nota
  Future<bool> insertGrade(Grade grade) async {
    try {
      await firestoreInstance.collection('grades').add(grade.toMap());
      return true;
    } catch (e) {
      throw Exception(e);
    }
  }

  //atualiza uma nota
  Future<bool> updateGrade(String id, num note, num faults) async {
    try {
      await firestoreInstance.collection('grades').doc(id).update({
        'note': note,
        'faults': faults,
      });
      return true;
    } catch (e) {
      throw Exception(e);
    }
  }
}
