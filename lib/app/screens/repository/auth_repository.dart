import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class AuthRepository extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;

  User? usuario;
  bool isLoading = true;

  AuthRepository() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen(
      (User? user) {
        usuario = (user == null) ? null : user;
        isLoading = false;
        notifyListeners();
      },
    );
  }

  _getUser() {
    usuario = _auth.currentUser;
    notifyListeners();
  }

  // sign up with email
  Future<User?> createUserWithEmailPass(String email, String pass) async {
    try {
      UserCredential dados = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );

      return dados.user;
    } on PlatformException catch (e) {
      throw Exception(e);
    }
  }

  // sign in with email and password
  Future<User?> signInEmailAndPassword(String email, String password) async {
    try {
      UserCredential dados = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return dados.user;
    } on PlatformException catch (e) {
      throw Exception(e);
    }
  }

  // sign out
  Future<void> logout() async {
    await _auth.signOut();
    _getUser();
  }

  //Requisição de nova senha
  Future<void> requestNewPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}
