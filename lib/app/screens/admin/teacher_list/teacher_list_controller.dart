import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../../core/models/teacher_user.dart';
import '../../../core/components/loader/loader_default.dart';

import '../../../core/service/snackbars.dart';
import '../admin_service.dart';
import '../home_page/home_controller.dart';

part 'teacher_list_controller.g.dart';

class TeacherListController = _TeacherListControllerBase
    with _$TeacherListController;

abstract class _TeacherListControllerBase with Store {
  AdminService _adminService = AdminService();

  //injeção de depencias da user admin
  String schoolId = Modular.get<HomeController>().userAdmin!.schoolId;

  @observable
  bool loading = false;

  //Lista de professores
  @observable
  List<TeacherUser>? teachers = [];

  //get de professores
  @action
  Future getTeachers(BuildContext context) async {
    final loader = LoaderDefault();
    try {
      loader.show();
      loading = true;
      teachers = await _adminService.getTeachers(schoolId);
      loading = false;
      loader.hide();
    } catch (e) {
      loader.hide();
      buildSnackBarUi(context, e.toString());
    }
  }
}
