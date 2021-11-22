import 'package:cloud_firestore/cloud_firestore.dart';
import '../../core/models/cycle.dart';

class CycleRepository {
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  //Cadastro da escola
  Future<bool> insertCycleSchool(String cicleId, Cycle cycle) async {
    return await firestoreInstance.collection('cycles').doc(cicleId).set({
      'name': cycle.name,
      'id_school': cycle.idSchool,
      'initial_date': cycle.initialDate,
      'final_date': cycle.finalDate
    }).then(
      (value) {
        return true;
      },
    ).catchError((error) => throw Exception(error));
  }
}
