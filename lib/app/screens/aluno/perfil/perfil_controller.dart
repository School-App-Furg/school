import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/models/student_user.dart';
import '../../../core/service/snackbars.dart';
import '../../../resources/auth_repository.dart';
import '../aluno_service.dart';

part 'perfil_controller.g.dart';

class PerfilController = _PerfilControllerBase with _$PerfilController;

abstract class _PerfilControllerBase with Store {
  AlunoService alunoService = AlunoService();
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
      await alunoService.requestNewPassword(mail!);
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
      await alunoService.updateStudent(student);
      alunoService.updateHome();
      buildSnackBarUi(context, "Aluno atualizado");
    } catch (e) {
      buildSnackBarUi(context, e.toString());
    }
  }
}
