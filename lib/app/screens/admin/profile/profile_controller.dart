import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/models/school_model.dart';
import '../../../core/service/snackbars.dart';
import '../../../resources/auth_repository.dart';
import '../admin_service.dart';

part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  AdminService adminService = AdminService();
  TextEditingController nameController = TextEditingController();
  TextEditingController cnpjController = TextEditingController();

  //injeção do email do usuário
  String? mail = Modular.get<AuthRepository>().usuario!.email;

  //Classe sendo inicializada
  SchoolModel school = SchoolModel(currentCycle: '', cnpj: '', name: '');

  //Carregar por rota perfil da escola
  initProfile(SchoolModel schoolModel) {
    school = schoolModel;
    nameController.text = schoolModel.name;
    cnpjController.text = schoolModel.cnpj;
  }

  //Enviar nova senha
  Future redefinirSenha(BuildContext context) async {
    try {
      await adminService.requestNewPassword(mail!);
      buildSnackBarUi(context, "E-mail de recuperação de senha enviado");
    } catch (e) {
      buildSnackBarUi(context, e.toString());
    }
  }

  //update dos dados da escola
  Future update(BuildContext context) async {
    try {
      school.name = nameController.text;
      school.cnpj = cnpjController.text;
      await adminService.updateSchool(school);
      adminService.updateHome();
      buildSnackBarUi(context, "Escola atualizada");
    } catch (e) {
      buildSnackBarUi(context, e.toString());
    }
  }
}
