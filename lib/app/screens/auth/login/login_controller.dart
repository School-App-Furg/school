import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/components/loader/loader_default.dart';
import '../../../core/service/snackbars.dart';
import '../../../resources/auth_repository.dart';
import '../../../resources/users_repository.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final AuthRepository _authRepository = AuthRepository();
  final UsersRepository _userRepository = UsersRepository();

  @observable
  TextEditingController emailController = TextEditingController();
  @observable
  TextEditingController senhaController = TextEditingController();
  @observable
  GlobalKey<FormState> formKey = GlobalKey();

  @observable
  bool obscureText = true;

  //Torna visível a senha
  @action
  void mostrarSenhaUser() {
    obscureText = !obscureText;
  }

  // função que verifica os dados de login e autoriza o acesso
  Future<void> login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      final loader = LoaderDefault();
      try {
        loader.show();
        final User? user = await _authRepository.signInEmailAndPassword(
            emailController.text, senhaController.text);
        final int type = await _userRepository.getUserType(user!.uid);
        loader.hide();
        if (type == 0) {
          Modular.to.pushReplacementNamed("/admin/");
        } else if (type == 1) {
          Modular.to.pushReplacementNamed("/professor/");
        } else if (type == 2) {
          Modular.to.pushReplacementNamed("/aluno/");
        }
      } catch (e) {
        loader.hide();
        buildSnackBarUi(context, e.toString());
      }
    }
  }
}
