import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../core/models/user_admin.dart';

class UsersRepository {
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  //Cadastro de usuário admin escola
  Future<bool> insertUserAdmin(String id, UserAdmin userAdmin) async {
    return await firestoreInstance.collection('users').doc(id).set({
      'school_id': userAdmin.schoolid,
      'name': userAdmin.name,
      'type': userAdmin.type
    }).then(
      (value) {
        return true;
      },
    ).catchError((error) => throw Exception(error));
  }

  //Pega as informações do user admin
  Future<UserAdmin?> getUserAdminById(String id) async {
    UserAdmin? model;
    try {
      await firestoreInstance.collection('users').doc(id).get().then(
        (DocumentSnapshot snapshot) {
          model = UserAdmin.fromJson(
            json.encode(snapshot.data()),
          );
        },
      );
    } catch (error) {
      throw Exception(error);
    }
    return model;
  }

  //Verificação do tipo do usuário
  Future<int> getUserType(String userId) async {
    try {
      DocumentSnapshot documentSnapshot =
          await firestoreInstance.collection('users').doc(userId).get();
      if (documentSnapshot.exists) {
        dynamic data = documentSnapshot.get('type');
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
