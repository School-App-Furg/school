import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../core/models/school_model.dart';

class SchoolRepository {
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  //cadastro de escola
  Future<String> insertScholl(SchoolModel _schoolModel) async {
    try {
      DocumentReference doc = await firestoreInstance
          .collection('schools')
          .add(_schoolModel.toMap());
      return doc.id;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<SchoolModel?> getSchoolInformationsById(String id) async {
    SchoolModel? model;
    try {
      var snapshot =
          await firestoreInstance.collection('schools').doc(id).get();
      var school = SchoolModel.fromJson(
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

  Future<List<SchoolModel?>> getSchools() async {
    List<SchoolModel?> list = [];
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await firestoreInstance.collection('schools').get();
      snapshot.docs.forEach(
        (element) {
          var school = SchoolModel.fromJson(
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
        },
      );
    } catch (error) {
      throw Exception(error);
    }
    return list;
  }

  //update do ciclo da escola
  Future<bool> updateCycleSchool(String cycleId, String schoolId) async {
    return await firestoreInstance.collection('schools').doc(schoolId).update({
      'currentCycle': cycleId,
    }).then(
      (value) {
        return true;
      },
    ).catchError((error) => throw Exception(error));
  }
}
