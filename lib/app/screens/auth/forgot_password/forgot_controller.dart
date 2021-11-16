import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../core/service/snackbars.dart';
import '../../repository/auth_repository.dart';
part 'forgot_controller.g.dart';

class ForgotController = _ForgotControllerBase with _$ForgotController;

abstract class _ForgotControllerBase with Store {
  AuthRepository _authRepository = AuthRepository();
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();

  Future<void> recuperarSenha(BuildContext context) async {
    try {
      await _authRepository.requestNewPassword(emailController.text);
      buildSnackBarUi(context, "Email de recuperação de senha enviado");
    } catch (e) {
      buildSnackBarUi(context, e.toString());
    }
  }
}
