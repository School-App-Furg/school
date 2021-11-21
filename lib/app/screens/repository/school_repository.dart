import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../core/models/school_model.dart';

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
}
