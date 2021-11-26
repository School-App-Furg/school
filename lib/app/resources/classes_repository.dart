import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../core/models/classes.dart';

class ClassesRepository {
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  //Retorna a lista de turmas cadastrada em uma determinada escola
  Future<List<Classes>?> getClassesBySchoolId(String id, String cycle) async {
    List<Classes>? list = [];
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await firestoreInstance
          .collection('classes')
          .where('schoolId', isEqualTo: id)
          .where('cycleId', isEqualTo: cycle)
          .get();
      snapshot.docs.forEach(
        (element) {
          list.add(
            Classes.fromJson(
              json.encode(
                element.data(),
              ),
            ),
          );
        },
      );
    } catch (error) {
      throw Exception(error);
    }
    return list;
  }
}
