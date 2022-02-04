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

  StudentUser student = StudentUser(cpf: '', name: '', type: 2, schoolId: '');

  //abertura dos controllers de inputs da tela
  TextEditingController nameController = TextEditingController();
  TextEditingController cpfController = TextEditingController();

  //injeção do email do email do user
  String? mail = Modular.get<AuthRepository>().usuario!.email;

  //carregamento de informações herdadas do user
  initProfile(StudentUser studentModel) {
    student = studentModel;
    nameController.text = studentModel.name;
    cpfController.text = studentModel.cpf;
  }

  //função para recuperação de senha
  Future recuperarSenha(BuildContext context) async {
    try {
      await alunoService.requestNewPassword(mail!);
      buildSnackBarUi(context, "E-mail de recuperação de senha enviado");
    } catch (e) {
      buildSnackBarUi(context, e.toString());
    }
  }

  //função de update de dados do aluno
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
