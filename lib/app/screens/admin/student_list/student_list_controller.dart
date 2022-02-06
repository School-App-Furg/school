import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/components/loader/loader_default.dart';
import '../../../core/models/student_user.dart';
import '../../../core/service/snackbars.dart';
import '../admin_service.dart';
import '../home_page/home_controller.dart';

part 'student_list_controller.g.dart';

class StudentListController = _StudentListControllerBase
    with _$StudentListController;

abstract class _StudentListControllerBase with Store {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  AdminService _adminService = AdminService();

  //injeção de depencias da user admin
  String schoolId = Modular.get<HomeController>().userAdmin!.schoolId;

  @observable
  bool loading = false;

  //Lista de professores
  @observable
  List<StudentUser>? students = [];

  //get de professores
  @action
  Future getStudents(BuildContext context) async {
    final loader = LoaderDefault();
    try {
      loader.show();
      loading = true;
      students = await _adminService.getStudentsBySchoolId(schoolId);
      loading = false;
      loader.hide();
    } catch (e) {
      loader.hide();
      buildSnackBarUi(context, e.toString());
    }
  }
}
