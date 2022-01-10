import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../core/models/school_model.dart';
import '../../../core/service/snackbars.dart';
import '../../../resources/auth_repository.dart';

part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  TextEditingController nameController = TextEditingController();
  AuthRepository _authRepository = AuthRepository();
  TextEditingController cnpjController = TextEditingController();

  //Carregar por rota perfil da escola
  initProfile(SchoolModel schoolModel) {
    nameController.text = schoolModel.name;
    cnpjController.text = schoolModel.cnpj;
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
