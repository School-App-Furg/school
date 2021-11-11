import 'package:cloud_firestore/cloud_firestore.dart';

class UsersRepository {
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  Future<bool> insertUser(
      String userId, String name, String cnpj, int type) async {
    return await firestoreInstance
        .collection('users')
        .doc(userId)
        .set({'name': name, 'cnpj': cnpj, 'tipo': type}).then(
      (value) {
        return true;
      },
    ).catchError((error) => throw Exception(error));
  }

  Future<int> getUserType(String userId) async {
    try {
      DocumentSnapshot documentSnapshot =
          await firestoreInstance.collection('users').doc(userId).get();
      if (documentSnapshot.exists) {
        dynamic data = documentSnapshot.get('tipo');
        if (data != null) {
          return data;
        }
      }
    } catch (error) {
      throw Exception(error);
    }
    return -1;
  }
}
