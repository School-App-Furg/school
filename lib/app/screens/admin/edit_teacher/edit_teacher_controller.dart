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
  final AdminService _adminService = AdminService();

  //Classe sendo inicializada
  @observable
  TeacherUser _teacherUser =
      TeacherUser(schoolId: '', name: '', cpf: '', type: 0);

  //injeção de depencias da user admin
  String schoolId = Modular.get<HomeController>().userAdmin!.schoolId;

  //lista de disciplinas da escola
  @observable
  List<Subject>? listOfsubjects = [];

  //bool para carregamento dos dados
  @observable
  bool loading = false;

  //Solicita as informações do professor ao firebase
  @action
  initEditPage(TeacherUser teacherUser) async {
    loading = true;
    _teacherUser = teacherUser;
    nameController.text = teacherUser.name;
    listOfsubjects = await _adminService.getSubjects(schoolId);
    await getSubjectsPreviusSelected(teacherUser);
    loading = false;
  }

  //Recebe a disciplina selecionada anteriormente deste professor
  @action
  getSubjectsPreviusSelected(TeacherUser teacherUser) {
    for (final subjectId in teacherUser.subjects!) {
      for (final element in listOfsubjects!) {
        if (subjectId == element.id) {
          listOfSubjectsSelected.add(element);
        }
      }
    }
  }

  @observable
  List<Subject> listOfSubjectsSelected = [];

  //disciplinas selecionadas
  @observable
  List<String> subjectsSelected = [];

  //recebe os valores selecionados no multiSelect
  @action
  setSubjectsSelected(List values) {
    subjectsSelected.clear();
    for (final element in values) {
      subjectsSelected.add(element.id);
    }
  }

  //edição de professores
  @action
  update(BuildContext context) async {
    final loader = LoaderDefault();
    try {
      loader.show();
      _teacherUser.name = nameController.text;
      _teacherUser.subjects = subjectsSelected;
      final bool updated = await _adminService.updateTeacher(_teacherUser);
      Modular.to.pop();
      if (updated) {
        loader.hide();
        buildSnackBarUi(context, "Professor atualizado!");
      } else {
        Modular.to.pop();
        loader.hide();
        buildSnackBarUi(context, "Erro ao atualizar o professor!");
      }
    } catch (e) {
      loader.hide();
      buildSnackBarUi(context, e.toString());
    }
  }
}
