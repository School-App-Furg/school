import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:school/app/screens/admin/admin_service.dart';
import '../../../core/components/loader/loader_default.dart';
import '../../../core/models/subject.dart';

import '../../../core/models/teacher_user.dart';
import '../../../core/service/snackbars.dart';
import '../home_page/home_controller.dart';

part 'register_teacher_controller.g.dart';

class RegisterTeacherController = _RegisterTeacherControllerBase
    with _$RegisterTeacherController;

abstract class _RegisterTeacherControllerBase with Store {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  AdminService _adminService = AdminService();

  //injeção de depencias da user admin
  String schoolId = Modular.get<HomeController>().managerUser!.schoolId;

  //lista de disciplinas da escola
  @observable
  List<Subject>? listOfsubjects = [];

  //listagem de disciplinas da escoa
  @action
  getSubjects() async {
    listOfsubjects = await _adminService.getSubjects(schoolId);
  }

  //disciplinas selecionadas
  @observable
  List<String> subjectsSelected = [];

  //recebe os valores selecionados no multiSelect
  @action
  setSubjectsSelected(List values) {
    subjectsSelected.clear();
    values.forEach(
      (element) {
        subjectsSelected.add(element.id);
      },
    );
  }

  cadastrar(BuildContext context) async {
    if (formKey.currentState!.validate() && subjectsSelected.isNotEmpty) {
      final loader = LoaderDefault();
      try {
        loader.show();

        //cadastra o user da escola
        var userTeacher = await _adminService.createUserWithEmailPass(
          emailController.text,
          "escola123",
        );

        //cadastra a escola e retorna o id da escola
        bool inserted = await _adminService.insertTeacher(
          userTeacher!.uid,
          TeacherUser(
              name: nameController.text,
              schoolId: schoolId,
              type: 2,
              subjects: subjectsSelected),
        );
        getTeachers(context);
        Navigator.of(context).pop();
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

  //Lista de disciplinas
  @observable
  List<TeacherUser>? teachers = [];

  //get de disciplinas
  @action
  Future getTeachers(BuildContext context) async {
    final loader = LoaderDefault();
    try {
      loader.show();
      teachers = await _adminService.getTeachers(schoolId);
      loader.hide();
    } catch (e) {
      loader.hide();
      buildSnackBarUi(context, e.toString());
    }
  }

  //exclusão de professores
  @action
  excluir(BuildContext context, String idTeacher) async {
    final loader = LoaderDefault();
    try {
      loader.show();
      bool removed = await _adminService.removeTeacher(idTeacher);
      getTeachers(context);
      Navigator.of(context).pop();
      if (removed) {
        loader.hide();
        buildSnackBarUi(context, "Professor removido!");
      } else {
        Navigator.of(context).pop();
        loader.hide();
        buildSnackBarUi(context, "Erro ao remover professor!");
      }
    } catch (e) {
      loader.hide();
      buildSnackBarUi(context, e.toString());
    }
  }

  update(BuildContext context) async {
    if (formKey.currentState!.validate() && subjectsSelected.isNotEmpty) {
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
          TeacherUser(
            name: nameController.text,
            schoolId: schoolId,
            type: 2,
          ),
        );
        getTeachers(context);
        Navigator.of(context).pop();
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
