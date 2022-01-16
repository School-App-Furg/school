import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../core/models/subject.dart';

class SubjectRepository {
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  //Retorna a lista de disciplinas cadastradas em uma determinada escola
  Future<List<Subject>> getSubjects(String id) async {
    List<Subject>? list = [];
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await firestoreInstance
          .collection('subjects')
          .where('schoolId', isEqualTo: id)
          .get();
      snapshot.docs.forEach(
        (element) {
          var teste = Subject.fromJson(
            json.encode(
              element.data(),
            ),
          );
          list.add(
            Subject(id: element.id, name: teste.name, schoolId: teste.schoolId),
          );
        },
      );
      return list;
    } catch (error) {
      throw Exception(error);
    }
  }

  //cadastro de disciplinas
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

  //atualização de dados de uma disciplina
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

  //remover disciplina
  Future<bool> removeSubject(String idSubject) async {
    return await firestoreInstance
        .collection('subjects')
        .doc(idSubject)
        .delete()
        .then(
      (value) {
        return true;
      },
    ).catchError(
      (error) => throw Exception(error),
    );
  }
}
