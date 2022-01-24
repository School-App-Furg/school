import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../core/models/grade.dart';

class GradesRepository {
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
  //Retorna a lista de disciplinas cadastradas em uma determinada escola
  Future<List<Grade>> getGrades(String studentId, String cycleId) async {
    List<Grade> list = [];
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await firestoreInstance
          .collection('grades')
          .where('student', isEqualTo: studentId)
          .where('cycle', isEqualTo: cycleId)
          .get();
      snapshot.docs.forEach(
        (element) {
          list.add(
            Grade.fromJson(
              json.encode(
                element.data(),
              ),
            ),
          );
        },
      );
      return list;
    } catch (error) {
      throw Exception(error);
    }
  }

  //Retorna a lista de disciplinas cadastradas em uma determinada escola
  Future<List<Grade>> getGradesForSubject(
      String studentId, String cycleId, String subject) async {
    List<Grade> list = [];
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await firestoreInstance
          .collection('grades')
          .where('student', isEqualTo: studentId)
          .where('cycle', isEqualTo: cycleId)
          .where('subject', isEqualTo: subject)
          .get();
      snapshot.docs.forEach(
        (element) {
          list.add(
            Grade.fromJson(
              json.encode(
                element.data(),
              ),
            ),
          );
        },
      );
      return list;
    } catch (error) {
      throw Exception(error);
    }
  }
}
