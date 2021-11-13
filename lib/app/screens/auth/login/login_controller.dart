import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:school/app/core/service/navigation.dart';
import 'package:school/app/core/service/snackbars.dart';
import 'package:school/app/screens/repository/auth_repository.dart';
import 'package:school/app/screens/repository/user_repository.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  AuthRepository _authRepository = AuthRepository();
  UsersRepository _userRepository = UsersRepository();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @observable
  bool obscureText = true;

  @action
  void mostrarSenhaUser() {
    obscureText = !obscureText;
  }

  // funão que verifica o os dados de login e autoriza o acesso
  Future<void> login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        User? user = await _authRepository.signInEmailAndPassword(
            emailController.text, senhaController.text);
        // ignore: unused_local_variable
        int type = await _userRepository.getUserType(user!.uid);
        navigateToInsideApp(context);
      } catch (e) {
        buildSnackBarUi(context, e.toString());
      }
    }
  }
}
