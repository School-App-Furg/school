import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:school/app/core/components/loader/loader_default.dart';
import 'package:school/app/core/models/subject.dart';
import 'package:school/app/core/service/snackbars.dart';
import 'package:school/app/screens/admin/admin_service.dart';
import 'package:school/app/screens/admin/home_page/home_controller.dart';

part 'register_subjects_controller.g.dart';

class RegisterSubjectsController = _RegisterSubjectsControllerBase
    with _$RegisterSubjectsController;

abstract class _RegisterSubjectsControllerBase with Store {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();

  AdminService _adminService = AdminService();

  //injeção de depencias da user admin
  String schoolId = Modular.get<HomeController>().userAdmin!.schoolid;

  cadastrar(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      final loader = LoaderDefault();
      try {
        loader.show();

        //cadastra o user da escola
        bool inserted = await _adminService.insertSubject(
            Subject(name: nameController.text, schoolId: schoolId));

        if (inserted) {
          loader.hide();
          buildSnackBarUi(context, "Disciplina cadastrada!");
        } else {
          loader.hide();
          buildSnackBarUi(context, "Erro ao cadastrar a disciplina!");
        }
      } catch (e) {
        loader.hide();
        buildSnackBarUi(context, e.toString());
      }
    }
  }
}
