import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/components/loader/loader_default.dart';
import '../../../core/models/subject.dart';
import '../../../core/service/snackbars.dart';
import '../admin_service.dart';
import '../subject_list/subject_list_controller.dart';

part 'edit_subject_controller.g.dart';

class EditSubjectController = _EditSubjectControllerBase
    with _$EditSubjectController;

abstract class _EditSubjectControllerBase with Store {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  AdminService _adminService = AdminService();

  //lista de disciplinas da escola
  @observable
  Subject _subjectReceived = Subject(name: '', schoolId: '');

  @observable
  bool loading = false;

  @action
  initEditPage(Subject subject) async {
    loading = true;
    _subjectReceived = subject;
    nameController.text = subject.name;
    loading = false;
  }

  //edição de professores
  @action
  update(BuildContext context) async {
    final loader = LoaderDefault();
    try {
      loader.show();
      _subjectReceived.name = nameController.text;
      bool updated = await _adminService.updateSubject(_subjectReceived);
      Modular.get<SubjectsListController>().getSubjects(context);
      Modular.to.pop();
      if (updated) {
        loader.hide();
        buildSnackBarUi(context, "Disciplina atualizada!");
      } else {
        Modular.to.pop();
        loader.hide();
        buildSnackBarUi(context, "Erro ao atualizar a disciplina!");
      }
    } catch (e) {
      loader.hide();
      buildSnackBarUi(context, e.toString());
    }
  }
}
