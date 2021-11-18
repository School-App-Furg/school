import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:school/app/core/components/loader/loader.dart';

import '../../../core/service/snackbars.dart';
import '../../repository/auth_repository.dart';
import '../../repository/user_repository.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  AuthRepository _authRepository = AuthRepository();
  UsersRepository _userRepository = UsersRepository();

  @observable
  TextEditingController emailController = TextEditingController();
  @observable
  TextEditingController senhaController = TextEditingController();
  @observable
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
      final overlay = LoadingOverlay.of(context);
      try {
        overlay.show();
        User? user = await _authRepository.signInEmailAndPassword(
            emailController.text, senhaController.text);
        // ignore: unused_local_variable
        int type = await _userRepository.getUserType(user!.uid);
        overlay.hide();
        Modular.to.pushReplacementNamed("/admin/");
      } catch (e) {
        overlay.hide();
        buildSnackBarUi(context, e.toString());
      }
    }
  }
}
