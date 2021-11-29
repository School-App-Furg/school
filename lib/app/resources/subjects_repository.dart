import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:school/app/core/models/subject.dart';

class SubjectRepository {
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  //Retorna a lista de disciplinas cadastradas em uma determinada escola
  Future<List<Subject>?> getSubjects(String id) async {
    List<Subject>? list = [];
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await firestoreInstance
          .collection('subjects')
          .where('schoolId', isEqualTo: id)
          .get();
      snapshot.docs.forEach(
        (element) {
          list.add(
            Subject.fromJson(
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

  //cadastro de disciplinas
  Future<bool> insertSubject(Subject subject) async {
    return await firestoreInstance.collection('subjects').doc().set({
      'school_id': subject.schoolId,
      'name': subject.name,
    }).then(
      (value) {
        return true;
      },
    ).catchError((error) => throw Exception(error));
  }
}
