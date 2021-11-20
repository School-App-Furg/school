import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:school/app/core/components/loader/loader_default.dart';

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
      final loader = LoaderDefault();
      try {
        loader.show();
        User? user = await _authRepository.signInEmailAndPassword(
            emailController.text, senhaController.text);
        int type = await _userRepository.getUserType(user!.uid);
        loader.hide();
        if (type == 0) {
          Modular.to.pushReplacementNamed("/admin/");
        } else if (type == 1) {
          Modular.to.pushReplacementNamed("/gestor/");
        } else if (type == 2) {
          Modular.to.pushReplacementNamed("/professor/");
        } else if (type == 3) {
          Modular.to.pushReplacementNamed("/aluno/");
        }
      } catch (e) {
        loader.hide();
        buildSnackBarUi(context, e.toString());
      }
    }
  }
}
