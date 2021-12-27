import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:school/app/screens/admin/admin_service.dart';
import '../../../core/models/management_user.dart';
import '../../../core/components/loader/loader_default.dart';

import '../../../core/service/snackbars.dart';

import '../home_page/home_controller.dart';

part 'register_manager_controller.g.dart';

class RegisterManagerController = _RegisterManagerControllerBase
    with _$RegisterManagerController;

abstract class _RegisterManagerControllerBase with Store {
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
        bool inserted = await _adminService.insertManagement(
          user!.uid,
          ManagementUser(
            name: nameController.text,
            schoolId: schoolId,
            type: 1,
          ),
        );
        if (inserted) {
          loader.hide();
          buildSnackBarUi(context, "Auxiliar cadastrado com sucesso!");
          Modular.to.pop();
        } else {
          loader.hide();
          buildSnackBarUi(context, "O Auxiliar não foi cadastrado!");
        }
      } catch (e) {
        loader.hide();
        buildSnackBarUi(context, e.toString());
      }
    }
  }
}
