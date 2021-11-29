import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:school/app/core/components/loader/loader_default.dart';
import 'package:school/app/core/models/teacher_user.dart';
import 'package:school/app/core/service/snackbars.dart';
import 'package:school/app/screens/admin/admin_service.dart';
import 'package:school/app/screens/admin/home_page/home_controller.dart';

part 'register_teacher_controller.g.dart';

class RegisterTeacherController = _RegisterTeacherControllerBase
    with _$RegisterTeacherController;

abstract class _RegisterTeacherControllerBase with Store {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  AdminService _adminService = AdminService();

  //injeção de depencias da user admin
  String schoolId = Modular.get<HomeController>().userAdmin!.schoolid;

  cadastrar(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      final loader = LoaderDefault();
      try {
        loader.show();

        //cadastra o user da escola
        User? user = await _adminService.createUserWithEmailPass(
          emailController.text,
          "escola123",
        );
        //cadastra a escola e retorna o id da escola
        bool inserted = await _adminService.insertTeacher(
          user!.uid,
          TeacherUser(name: nameController.text, schoolid: schoolId, type: 2),
        );
        if (inserted) {
          loader.hide();
          buildSnackBarUi(context, "Professor cadastrado com sucesso!");
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
