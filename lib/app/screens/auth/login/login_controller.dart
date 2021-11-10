import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:school/app/core/service/navigation.dart';
import 'package:school/app/screens/repository/auth_repository.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  AuthRepository _authRepository = AuthRepository();

  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @observable
  bool obscureText = true;

  @action
  void mostrarSenhaUser() {
    obscureText = !obscureText;
  }

  login(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Future<User?> login = _authRepository.signInEmailAndPassword(
          emailController.text, senhaController.text);
      navigateToHomePage(context);
    }
  }
}
