import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../core/models/subject.dart';

class SubjectRepository {
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  //Retorna a lista de disciplinas cadastradas em uma determinada escola
  Future<List<Subject>> getSubjects(String id) async {
    final List<Subject> list = [];
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await firestoreInstance
              .collection('subjects')
              .where('schoolId', isEqualTo: id)
              .get();
      for (final element in snapshot.docs) {
        final teste = Subject.fromJson(
          json.encode(
            element.data(),
          ),
        );
        list.add(
          Subject(id: element.id, name: teste.name, schoolId: teste.schoolId),
        );
      }
      return list;
    } catch (error) {
      throw Exception(error);
    }
  }

  //cadastra uma disciplina
  Future<bool> insertSubject(Subject subject) async {
    return await firestoreInstance.collection('subjects').doc().set({
      'schoolId': subject.schoolId,
      'name': subject.name,
      'teachers': []
    }).then(
      (value) {
        return true;
      },
    ).catchError((error) => throw Exception(error));
  }

  //atualiza uma disciplina
  Future<bool> updateSubject(Subject subject) async {
    return await firestoreInstance
        .collection('subjects')
        .doc(subject.id)
        .update({
      'name': subject.name,
    }).then(
      (value) {
        return true;
      },
    ).catchError((error) => throw Exception(error));
  }
}
