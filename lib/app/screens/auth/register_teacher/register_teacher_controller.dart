import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:mobx/mobx.dart';
import '../../../core/models/school_model.dart';

import '../auth_service.dart';

import '../../../core/components/loader/loader_default.dart';

import '../../../core/models/teacher_user.dart';
import '../../../core/service/snackbars.dart';

part 'register_teacher_controller.g.dart';

class RegisterTeacherController = _RegisterTeacherControllerBase
    with _$RegisterTeacherController;

abstract class _RegisterTeacherControllerBase with Store {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  AuthService _authService = AuthService();

  @observable
  bool obscureText = true;

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

  // escola selecionada
  @observable
  String school = '';

  cadastrar(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      final loader = LoaderDefault();
      try {
        loader.show();

        //cadastra o user da escola
        var userTeacher = await _authService.createUserWithEmailPass(
          emailController.text,
          senhaController.text,
        );

        //cadastra a escola e retorna o id da escola
        bool inserted = await _authService.insertTeacher(
          userTeacher!.uid,
          TeacherUser(
              name: nameController.text,
              schoolId: school,
              type: 1,
              cpf: cpfController.text),
        );

        if (inserted) {
          loader.hide();
          Modular.to.pushReplacementNamed("/professor/");
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
