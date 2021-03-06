import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/service/snackbars.dart';
import '../../../resources/auth_repository.dart';

part 'forgot_controller.g.dart';

class ForgotController = _ForgotControllerBase with _$ForgotController;

abstract class _ForgotControllerBase with Store {
  final AuthRepository _authRepository = AuthRepository();
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();

  //Recuperação de senha com base no usuário e email cadastrado
  Future<void> recuperarSenha(BuildContext context) async {
    try {
      await _authRepository.requestNewPassword(emailController.text);
      buildSnackBarUi(context, "E-mail de recuperação de senha enviado");
    } catch (e) {
      buildSnackBarUi(context, e.toString());
    }
  }
}
