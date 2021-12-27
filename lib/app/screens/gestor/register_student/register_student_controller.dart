import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:school/app/screens/admin/admin_service.dart';
import '../../../core/components/loader/loader_default.dart';
import '../../../core/models/student_user.dart';
import '../../../core/service/snackbars.dart';
import '../home_page/home_controller.dart';

part 'register_student_controller.g.dart';

class RegisterStudentController = _RegisterStudentControllerBase
    with _$RegisterStudentController;

abstract class _RegisterStudentControllerBase with Store {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  AdminService _adminService = AdminService();

  //injeção de depencias da user admin
  String schoolId = Modular.get<HomeController>().managerUser!.schoolId;

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
        bool inserted = await _adminService.insertStudent(
          user!.uid,
          StudentUser(
            name: nameController.text,
            schoolId: schoolId,
            type: 3,
          ),
        );
        if (inserted) {
          emailController.clear();
          nameController.clear();
          loader.hide();
          buildSnackBarUi(context, "Aluno cadastrado com sucesso!");
        } else {
          loader.hide();
          buildSnackBarUi(context, "Aluno não foi cadastrado!");
        }
      } catch (e) {
        loader.hide();
        buildSnackBarUi(context, e.toString());
      }
    }
  }
}
