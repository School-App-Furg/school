import 'package:cloud_firestore/cloud_firestore.dart';

class UsersRepository {
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  Future<bool> insertUser(
      String userId, String name, String cnpj, int type) async {
    return await firestoreInstance
        .collection('users')
        .doc(userId)
        .set({'name': name, 'cnpj': cnpj, 'tipo': type}).then((value) {
      return true;
    }).catchError((error) => throw Exception(error));
  }
}
