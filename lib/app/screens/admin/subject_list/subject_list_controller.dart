import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/components/loader/loader_default.dart';
import '../../../core/models/subject.dart';
import '../../../core/service/snackbars.dart';
import '../admin_service.dart';
import '../home_page/home_controller.dart';

part 'subject_list_controller.g.dart';

class SubjectsListController = _SubjectsListControllerBase
    with _$SubjectsListController;

abstract class _SubjectsListControllerBase with Store {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  AdminService _adminService = AdminService();

  //injeção de depencias da user admin
  String schoolId = Modular.get<HomeController>().userAdmin!.schoolId;

  @observable
  bool loading = false;

  //cadastro de disciplinas
  @action
  cadastrar(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      final loader = LoaderDefault();
      try {
        loader.show();
        //cadastra o user da escola
        bool inserted = await _adminService.insertSubject(
            Subject(name: nameController.text, schoolId: schoolId));
        subjects = await _adminService.getSubjects(schoolId);
        Navigator.of(context).pop();
        if (inserted) {
          nameController.clear();
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

  //Lista de disciplinas
  @observable
  List<Subject>? subjects = [];

  //get de disciplinas
  @action
  Future getSubjects(BuildContext context) async {
    final loader = LoaderDefault();
    try {
      loader.show();
      loading = true;
      subjects = await _adminService.getSubjects(schoolId);
      loading = false;
      loader.hide();
    } catch (e) {
      loader.hide();
      buildSnackBarUi(context, e.toString());
    }
  }

  //exclusão de disciplinas
  @action
  excluir(BuildContext context, String idSubject) async {
    final loader = LoaderDefault();
    try {
      loader.show();
      bool removed = await _adminService.removeSubject(idSubject);
      subjects = await _adminService.getSubjects(schoolId);
      Navigator.of(context).pop();
      if (removed) {
        loader.hide();
        buildSnackBarUi(context, "Disciplina removida!");
      } else {
        Navigator.of(context).pop();
        loader.hide();
        buildSnackBarUi(context, "Erro ao remover a disciplina!");
      }
    } catch (e) {
      loader.hide();
      buildSnackBarUi(context, e.toString());
    }
  }
}
