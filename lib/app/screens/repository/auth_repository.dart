import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:school/app/core/errors/auth_error.dart';

class AuthRepository extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;

  AuthRepository() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen(
      (User? user) {
        usuario = (user == null) ? null : user;
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

  // sign in with email and password
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

  // sign out
  Future<void> logout() async {
    await _auth.signOut();
    _getUser();
  }

  // check signIn
  Stream<User?> isSignedIn() {
    var currentUser = _auth.authStateChanges();
    return currentUser;
  }

  // get current user
  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  //Requisição de nova senha
  Future<void> requestNewPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}
