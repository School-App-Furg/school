import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/components/loader/loader_default.dart';
import '../../../core/models/subject.dart';
import '../../../core/models/teacher_user.dart';
import '../../../core/service/snackbars.dart';
import '../admin_service.dart';
import '../home_page/home_controller.dart';

part 'edit_teacher_controller.g.dart';

class EditTeacherController = _EditTeacherControllerBase
    with _$EditTeacherController;

abstract class _EditTeacherControllerBase with Store {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  AdminService _adminService = AdminService();

  //injeção de depencias da user admin
  String schoolId = Modular.get<HomeController>().userAdmin!.schoolId;

  //lista de disciplinas da escola
  @observable
  List<Subject>? listOfsubjects = [];

  @action
  initEditPage(TeacherUser teacherUser) {
    nameController.text = teacherUser.name;
    getSubjects();
  }

  @observable
  List<Subject>? listOfSubjectsSelected = [];

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

  //exclusão de professores
  @action
  excluir(BuildContext context, String idTeacher) async {
    final loader = LoaderDefault();
    try {
      loader.show();
      bool removed = await _adminService.removeTeacher(idTeacher);

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
}
