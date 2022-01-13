import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:school/app/core/models/student_user.dart';
import 'package:school/app/core/service/snackbars.dart';
import 'package:school/app/resources/auth_repository.dart';

part 'perfil_controller.g.dart';

class PerfilController = _PerfilControllerBase with _$PerfilController;

abstract class _PerfilControllerBase with Store {
  TextEditingController nameController = TextEditingController();
  AuthRepository _authRepository = AuthRepository();
  TextEditingController cpfController = TextEditingController();

  //Carregar por rota perfil da escola
  initProfile(StudentUser studentModel) {
    nameController.text = studentModel.name;
    cpfController.text = studentModel.cpf;
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
