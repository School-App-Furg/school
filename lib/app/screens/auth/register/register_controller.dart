import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import '../../../core/service/navigation.dart';
import '../../../core/service/snackbars.dart';

import '../../repository/auth_repository.dart';
import '../../repository/user_repository.dart';
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
  cadastrar(BuildContext context) async {
    print(cnpjController.text.trim());
    if (formKey.currentState!.validate()) {
      try {
        User? user = await _authRepository.createUserWithEmailPass(
          emailController.text,
          senhaController.text,
        );
        await user!.updateDisplayName(nomeEscolaController.text);
        bool inserted = await _userRepository.insertUser(
            user.uid, nomeEscolaController.text, cnpjController.text, 0);
        if (inserted) {
          navigateToInsideApp(context);
        } else {
          buildSnackBarUi(context, "Seu usuário não foi cadastrado!");
        }
      } catch (e) {
        buildSnackBarUi(context, e.toString());
      }
    }
  }
}
