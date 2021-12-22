import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import '../core/errors/auth_error.dart';

class AuthRepository extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;

  AuthRepository() {
    _authCheck();
  }

  //verificação do usuário
  _authCheck() {
    _auth.authStateChanges().listen(
      (User? user) {
        usuario = (user == null) ? null : user;
        notifyListeners();
      },
    );
  }

  //pegar o usuário existente em memória
  _getUser() {
    usuario = _auth.currentUser;
    notifyListeners();
  }

  // cadastro por email
  Future<User?> createUserWithEmailPass(String email, String pass) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw authErrorHandler(e);
    }
  }

  //remover user
  Future removeUser(User user) async {
    try {} on FirebaseAuthException catch (e) {
      throw authErrorHandler(e);
    }
  }

  // acesso por email e senhaa
  Future<User?> signInEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw authErrorHandler(e);
    }
  }

  // logout do app
  Future<void> logout() async {
    await _auth.signOut();
    _getUser();
  }

  //Requisição de nova senha
  Future<void> requestNewPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}
