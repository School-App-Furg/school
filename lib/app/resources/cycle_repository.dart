import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../core/models/cycle.dart';

class CycleRepository {
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  //cadastro de um novo ciclo
  Future<String> insertCycle(Cycle cycle) async {
    try {
      final data =
          await firestoreInstance.collection('cycles').add(cycle.toMap());
      return data.id;
    } catch (e) {
      throw Exception(e);
    }
  }

  //cadastro do primeiro ciclo de uma escola
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

  //pega as informações de um determinado ciclo
  Future<Cycle?> getCurrentCycle(String uid) async {
    Cycle? model;
    try {
      await firestoreInstance.collection('cycles').doc(uid).get().then(
        (DocumentSnapshot snapshot) {
          final Cycle data = Cycle.fromJson(
            json.encode(snapshot.data()),
          );
          model = Cycle(
              id: snapshot.id,
              name: data.name,
              idSchool: data.idSchool,
              approvalPattern: data.approvalPattern,
              evaluationStandard: data.evaluationStandard,
              initialDate: data.initialDate,
              finalDate: data.finalDate);
        },
      );
    } catch (error) {
      throw Exception(error);
    }
    return model;
  }

  //get de lista de ciclos de uma determinada escola
  Future<List<Cycle?>> getCycles(String schoolId, String cycleId) async {
    final List<Cycle> list = [];
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await firestoreInstance
              .collection('cycles')
              .where('idSchool', isEqualTo: schoolId)
              .where(FieldPath.documentId, isNotEqualTo: cycleId)
              .get();
      for (final element in snapshot.docs) {
        final Cycle cycle = Cycle.fromJson(
          json.encode(
            element.data(),
          ),
        );
        list.add(
          Cycle(
              id: element.id,
              approvalPattern: cycle.approvalPattern,
              evaluationStandard: cycle.evaluationStandard,
              finalDate: cycle.finalDate,
              idSchool: cycle.idSchool,
              initialDate: cycle.initialDate,
              name: cycle.name),
        );
      }
    } catch (error) {
      throw Exception(error);
    }
    return list;
  }

  //atualiza o ciclo de uma escola
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
