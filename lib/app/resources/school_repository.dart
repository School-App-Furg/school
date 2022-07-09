import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../core/models/school_model.dart';

class SchoolRepository {
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  //cadastro de escola
  Future<String> insertScholl(SchoolModel _schoolModel) async {
    try {
      final DocumentReference doc = await firestoreInstance
          .collection('schools')
          .add(_schoolModel.toMap());
      return doc.id;
    } catch (e) {
      throw Exception(e);
    }
  }

  //retorna as informações de uma escola com base em um id
  Future<SchoolModel?> getSchoolInformationsById(String id) async {
    SchoolModel? model;
    try {
      final snapshot =
          await firestoreInstance.collection('schools').doc(id).get();
      final school = SchoolModel.fromJson(
        json.encode(
          snapshot.data(),
        ),
      );
      model = SchoolModel(
        id: snapshot.id,
        currentCycle: school.currentCycle,
        cnpj: school.cnpj,
        name: school.name,
      );
    } catch (error) {
      throw Exception(error);
    }
    return model;
  }

  //pega a lista de escola
  Future<List<SchoolModel?>> getSchools() async {
    final List<SchoolModel?> list = [];
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await firestoreInstance.collection('schools').get();
      for (final element in snapshot.docs) {
        final school = SchoolModel.fromJson(
          json.encode(
            element.data(),
          ),
        );
        list.add(
          SchoolModel(
            id: element.id,
            currentCycle: school.currentCycle,
            cnpj: school.cnpj,
            name: school.name,
          ),
        );
      }
    } catch (error) {
      throw Exception(error);
    }
    return list;
  }

  //atualiza o ciclo de uma escola
  Future<bool> updateCycleSchool(String cycleId, String schoolId) async {
    return await firestoreInstance.collection('schools').doc(schoolId).update({
      'currentCycle': cycleId,
    }).then(
      (value) {
        return true;
      },
    ).catchError((error) => throw Exception(error));
  }

  //atualiza uma escola
  Future<bool> updateSchool(SchoolModel _schoolModel) async {
    try {
      await firestoreInstance
          .collection('schools')
          .doc(_schoolModel.id)
          .set(_schoolModel.toMap());
      return true;
    } catch (e) {
      throw Exception(e);
    }
  }
}
