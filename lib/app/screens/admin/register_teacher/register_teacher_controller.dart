import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:school/app/core/components/loader/loader_default.dart';
import 'package:school/app/core/models/teacher_user.dart';
import 'package:school/app/core/service/snackbars.dart';
import 'package:school/app/screens/auth/auth_service.dart';

part 'register_teacher_controller.g.dart';

class RegisterTeacherController = _RegisterTeacherControllerBase
    with _$RegisterTeacherController;

abstract class _RegisterTeacherControllerBase with Store {
  @observable
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  AuthService _authService = AuthService();

  cadastrar(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      final loader = LoaderDefault();
      try {
        loader.show();

        //cadastra o user da escola
        User? user = await _authService.createUserWithEmailPass(
          emailController.text,
          senhaController.text = "escola123",
        );
        //cadastra a escola e retorna o id da escola
        String idTeacher = await _authService.insertTeacher(
          user!.uid,
          TeacherUser(
              name: nameController.text,
              classes: [],
              schoolid: "",
              subjects: [],
              type: 2),
        );
      } catch (e) {
        loader.hide();
        buildSnackBarUi(context, e.toString());
      }
    }
  }
}
