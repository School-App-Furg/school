import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/components/loader/loader_default.dart';
import '../../../core/models/cycle.dart';
import '../../../core/models/school_model.dart';
import '../../../core/models/user_admin.dart';
import '../../../core/service/snackbars.dart';
import '../auth_service.dart';

part 'register_school_controller.g.dart';

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
            currentCycle: user!.uid,
            cnpj: cnpjController.text,
            name: nomeEscolaController.text,
          ),
        );

        //cadastra o primeiro ciclo com o docId igual o id do User , retorna true se tiver sido cadastrado
        bool insertedCycle = await _authService.insertFirstCycleSchool(
          user.uid,
          Cycle(
            name: DateTime.now().year.toString(),
            idSchool: idSchool,
            finalDate: DateTime.now().millisecondsSinceEpoch,
            initialDate: DateTime.now().millisecondsSinceEpoch,
            approvalPattern: '70%',
            evaluationStandard: 'Bimestral',
          ),
        );

        //Cadastra as demais informações do user admin
        bool inserted = await _authService.insertUserAdmin(
          user.uid,
          UserAdmin(
              schoolId: idSchool, name: nomeEscolaController.text, type: 0),
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
