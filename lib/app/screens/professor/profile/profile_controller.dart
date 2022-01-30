import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../../core/models/teacher_user.dart';
import '../professor_service.dart';

import '../../../core/service/snackbars.dart';
import '../../../resources/auth_repository.dart';

part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  ProfessorService professorService = ProfessorService();
  TextEditingController nameController = TextEditingController();
  TextEditingController cpfController = TextEditingController();

//injeção do email do usuário
  String? mail = Modular.get<AuthRepository>().usuario!.email;

  TeacherUser teacher = TeacherUser(schoolId: '', name: '', cpf: '', type: 0);

  //Carregar por rota perfil da escola
  initProfile(TeacherUser teacherUser) {
    teacher = teacherUser;
    nameController.text = teacherUser.name;
    cpfController.text = teacherUser.cpf;
  }

  //Enviar numa senha
  Future redefinirSenha(BuildContext context) async {
    try {
      await professorService.requestNewPassword(mail!);
      buildSnackBarUi(context, "E-mail de recuperação de senha enviado");
    } catch (e) {
      buildSnackBarUi(context, e.toString());
    }
  }

  //update dos dados da escola
  Future update(BuildContext context) async {
    try {
      teacher.name = nameController.text;
      teacher.cpf = cpfController.text;
      await professorService.updateTeacher(teacher);
      professorService.updateHome();
      buildSnackBarUi(context, "Dados atualizados");
    } catch (e) {
      buildSnackBarUi(context, e.toString());
    }
  }
}
