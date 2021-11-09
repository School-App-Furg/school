import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:school/app/core/service/navigation.dart';
import 'package:school/app/screens/repository/auth_repository.dart';
import 'package:validators2/validators.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final FormErrorState error = FormErrorState();
  AuthRepository _authRepository = AuthRepository();

  @observable
  String email = "";

  @action
  validateEmail(String value) {
    error.email = isEmail(value) ? null : 'E-mail inválido';
  }

  //-----------------------------------------

  @observable
  String senha = "";

  @action
  validateSenha(String value) {
    error.senha =
        isNull(value) || value.isEmpty ? 'Senha precisa ser preenchida' : null;
  }

  //-----------------------------------------

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  late List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => email, validateEmail),
      reaction((_) => senha, validateSenha)
    ];
  }

  login(BuildContext context) {
    if ((validateEmail(email) != null) || (validateSenha(senha)) != null) {
      Future<User?> login =
          _authRepository.signInEmailAndPassword(email, senha);
      if (login != null) {
        navigateToHomePage(context);
      }
    }
  }
}

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String? email;

  @observable
  String? senha;

  @computed
  bool get hasErrors => email != null || senha != null;
}
