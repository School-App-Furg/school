import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../core/models/cycle.dart';

class CycleRepository {
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  //cadastro de turmas
  Future<String> insertCycle(Cycle cycle) async {
    try {
      var data =
          await firestoreInstance.collection('cycles').add(cycle.toMap());
      return data.id;
    } catch (e) {
      throw Exception(e);
    }
  }

  //cadastro de turmas
  Future<bool> insertFirstCycle(String idCycle, Cycle cycle) async {
    try {
      await firestoreInstance
          .collection('cycles')
          .doc(idCycle)
          .set(cycle.toMap());
      return true;
    } catch (e) {
      throw Exception(e);
    }
  }

  //Cadastra um ciclo de uma escola
  Future<Cycle?> getCurrentCycle(String uid) async {
    Cycle? model;
    try {
      await firestoreInstance.collection('cycles').doc(uid).get().then(
        (DocumentSnapshot snapshot) {
          model = Cycle.fromJson(
            json.encode(snapshot.data()),
          );
        },
      );
    } catch (error) {
      throw Exception(error);
    }
    return model;
  }

  //Cadastra um ciclo de uma escola
  Future<bool> updateCycle(String cicleId, Cycle cycle) async {
    return await firestoreInstance.collection('cycles').doc(cicleId).set({
      'name': cycle.name,
      'idSchool': cycle.idSchool,
      'initialDate': cycle.initialDate,
      'finalDate': cycle.finalDate,
      'evaluationStandard': cycle.evaluationStandard,
      'approvalPattern': cycle.approvalPattern,
    }).then(
      (value) {
        return true;
      },
    ).catchError((error) => throw Exception(error));
  }
}
