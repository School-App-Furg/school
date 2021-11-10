import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import 'package:school/app/screens/repository/auth_repository.dart';
import 'package:school/app/screens/repository/user_repository.dart';
part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  GlobalKey<FormState> formKey = GlobalKey();
  AuthRepository _authRepository = AuthRepository();
  UsersRepository _userRepository = UsersRepository();

  TextEditingController nomeEscolaController = TextEditingController();
  TextEditingController cnpjController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  @observable
  bool obscureText = true;

  @action
  void mostrarSenhaUser() {
    obscureText = !obscureText;
  }

  //função de cadastro do usuário
  teste() {
    print(emailController.text);
  }

  cadastrar() async {
    if (formKey.currentState!.validate()) {
      var data = await _authRepository.createUserWithEmailPass(
        emailController.text,
        senhaController.text,
      );
      _userRepository.insertUser(
          data!.uid, nomeEscolaController.text, cnpjController.text, 0);
    }
  }
}
