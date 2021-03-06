import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/models/classes.dart';
import '../../../core/models/student_user.dart';
import '../../../core/service/snackbars.dart';
import '../admin_service.dart';

part 'students_list_for_class_controller.g.dart';

class StudentsListForClassController = _StudentsListForClassControllerBase
    with _$StudentsListForClassController;

abstract class _StudentsListForClassControllerBase with Store {
  final AdminService _adminService = AdminService();

  //bool para carregamento dos dados
  @observable
  bool loading = false;

  // carregamento de alunos da turma
  @action
  Future initPage(BuildContext context, Classes classes) async {
    try {
      loading = true;
      students = await _adminService.getStudentsForClass(classes.students!);
      loading = false;
    } catch (e) {
      buildSnackBarUi(context, e.toString());
    }
  }

  //Lista de alunos
  @observable
  List<StudentUser?> students = [];
}
