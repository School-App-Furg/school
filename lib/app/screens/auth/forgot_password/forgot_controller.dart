import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:school/app/screens/repository/auth_repository.dart';
part 'forgot_controller.g.dart';

class ForgotController = _ForgotControllerBase with _$ForgotController;

abstract class _ForgotControllerBase with Store {
  AuthRepository _authRepository = AuthRepository();

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();

  recuperarSenha() {
    if (formKey.currentState!.validate()) {
      _authRepository.requestNewPassword(emailController.text);
    }
  }
}
