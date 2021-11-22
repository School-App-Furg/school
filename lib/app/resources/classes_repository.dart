import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../core/models/classes.dart';

class ClassesRepository {
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  Future<List<Classes>?> getClassesBySchoolId(String id) async {
    List<Classes>? list = [];
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await firestoreInstance
          .collection('classes')
          .where('schoolId', isEqualTo: id)
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
