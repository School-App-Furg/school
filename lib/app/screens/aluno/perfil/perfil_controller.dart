import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../resources/auth_repository.dart';
import '../../admin/admin_service.dart';


import '../../../core/models/student_user.dart';
import '../../../core/service/snackbars.dart';

part 'perfil_controller.g.dart';

class PerfilController = _PerfilControllerBase with _$PerfilController;

abstract class _PerfilControllerBase with Store {
  AdminService adminService = AdminService();
  TextEditingController nameController = TextEditingController();
  TextEditingController cpfController = TextEditingController();

  //injeção do email do usuário
  String? mail = Modular.get<AuthRepository>().usuario!.email;

  StudentUser student = StudentUser(cpf: '', name: '', type: 2, schoolId: '');

  //Carregar por rota perfil do aluno
  initProfile(StudentUser studentModel) {
    student = studentModel;
    nameController.text = studentModel.name;
    cpfController.text = studentModel.cpf;
  }

  Future<void> recuperarSenha(BuildContext context) async {
    try {
      await adminService.requestNewPassword(mail!);
      buildSnackBarUi(context, "E-mail de recuperação de senha enviado");
    } catch (e) {
      buildSnackBarUi(context, e.toString());
    }
  }

  //update dos dados do aluno
  Future update(BuildContext context) async {
    try {
      student.name = nameController.text;
      student.cpf = cpfController.text;
      await adminService.updateStudent(student);
      adminService.updateHome();
      buildSnackBarUi(context, "Aluno atualizado");
    } catch (e) {
      buildSnackBarUi(context, e.toString());
    }
  }
}
