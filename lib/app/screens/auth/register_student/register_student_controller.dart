import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/components/loader/loader_default.dart';
import '../../../core/models/school_model.dart';
import '../../../core/models/student_user.dart';
import '../../../core/service/snackbars.dart';
import '../auth_service.dart';

part 'register_student_controller.g.dart';

class RegisterStudentController = _RegisterStudentControllerBase
    with _$RegisterStudentController;

abstract class _RegisterStudentControllerBase with Store {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  final AuthService _authService = AuthService();

  @observable
  bool obscureText = true;

  //Torna visível a senha
  @action
  void mostrarSenhaUser() {
    obscureText = !obscureText;
  }

  //listagem de escolas existentes no app
  @action
  getSchools() async {
    listOfSchools = await _authService.getSchools();
  }

  //lista de escolas
  @observable
  List<SchoolModel?> listOfSchools = [];

  //função para setar escola selecionada
  @action
  setSchool(String? value) {
    school = value!;
  }

  //escola selecionada
  @observable
  String school = '';

  //Cadastro de aluno
  cadastrar(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      final loader = LoaderDefault();
      try {
        loader.show();

        //cadastra o user da escola
        final userStudent = await _authService.createUserWithEmailPass(
          emailController.text,
          senhaController.text,
        );

        //cadastra a escola e retorna o id da escola
        final bool inserted = await _authService.insertStudent(
          userStudent!.uid,
          StudentUser(
            name: nameController.text,
            schoolId: school,
            type: 2,
            cpf: cpfController.text,
          ),
        );

        if (inserted) {
          loader.hide();
          Modular.to.pushReplacementNamed("/aluno/");
        } else {
          loader.hide();
          buildSnackBarUi(context, "Professor não foi cadastrado!");
        }
      } catch (e) {
        loader.hide();
        buildSnackBarUi(context, e.toString());
      }
    }
  }
}
