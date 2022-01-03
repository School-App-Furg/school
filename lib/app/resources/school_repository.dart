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
      await firestoreInstance.collection('schools').doc(id).get().then(
        (DocumentSnapshot snapshot) {
          model = SchoolModel.fromJson(
            json.encode(snapshot.data()),
          );
        },
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
                closingDate: school.closingDate,
                logo: school.logo,
                name: school.name,
                regime: school.regime),
          );
        },
      );
    } catch (error) {
      throw Exception(error);
    }
    return list;
  }
}
