import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../auth_service.dart';

import '../../../core/components/loader/loader_default.dart';
import '../../../core/models/cycle.dart';
import '../../../core/models/school_model.dart';
import '../../../core/models/user_admin.dart';
import '../../../core/service/snackbars.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  GlobalKey<FormState> formKey = GlobalKey();
  AuthService _authService = AuthService();

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
    if (formKey.currentState!.validate()) {
      final loader = LoaderDefault();
      try {
        loader.show();

        //cadastra o user da escola
        User? user = await _authService.createUserWithEmailPass(
          emailController.text,
          senhaController.text,
        );
        //cadastra a escola e retorna o id da escola
        String idSchool = await _authService.insertScholl(
          SchoolModel(
              currentCycle: 0,
              cnpj: cnpjController.text,
              closingDate: DateTime.now(),
              logo:
                  'https://firebasestorage.googleapis.com/v0/b/school-973bf.appspot.com/o/logo_escola.jpg?alt=media&token=21836ae2-fc5b-49e9-b0ff-2fc920159fef',
              name: nomeEscolaController.text,
              regime: 0),
        );

        //cadastra o primeiro ciclo com o docId igual o id do User , retorna true se tiver sido cadastrado
        bool insertedCycle = await _authService.insertCycleSchool(
          user!.uid,
          Cycle(
            name: "Ciclo 0",
            idSchool: idSchool,
            initialDate: DateTime.now(),
            finalDate: DateTime.now(),
          ),
        );

        //Cadastra as demais informações do user admin
        bool inserted = await _authService.insertUserAdmin(
          user.uid,
          UserAdmin(
              schoolid: idSchool, name: nomeEscolaController.text, type: 0),
        );
        if (inserted && insertedCycle) {
          loader.hide();
          Modular.to.pushReplacementNamed("/admin/");
        } else {
          loader.hide();
          buildSnackBarUi(context, "Seu usuário não foi cadastrado!");
        }
      } catch (e) {
        loader.hide();
        buildSnackBarUi(context, e.toString());
      }
    }
  }
}
