import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/models/teacher_user.dart';
import '../../../core/service/snackbars.dart';

part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  TextEditingController nameController = TextEditingController();

  TextEditingController cpfController = TextEditingController();

  //Carregar por rota perfil da escola
  initProfile(TeacherUser teacherModel) {
    nameController.text = teacherModel.name;
    cpfController.text = teacherModel.cpf;
  }

  //Enviar numa senha
  Future<void> recuperarSenha(BuildContext context) async {
    try {
      //VALIDAR REQUISIÇÃO ABAIXO POIS NO _authRepository NÃO ESTOU CONSEGUINDO CHAMAR EMAIL
      //await _authRepository.requestNewPassword(_authRepository.usuario!.email);
      buildSnackBarUi(context, "E-mail de recuperação de senha enviado");
    } catch (e) {
      buildSnackBarUi(context, e.toString());
    }
  }
}
