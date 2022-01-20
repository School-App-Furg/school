import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:school/app/core/models/classes.dart';
import 'package:school/app/core/models/school_model.dart';
import 'package:school/app/core/models/student_user.dart';

import '../admin_service.dart';
import '../home_page/home_controller.dart';

part 'school_report_controller.g.dart';

class SchoolReportController = _SchoolReportControllerBase
    with _$SchoolReportController;

abstract class _SchoolReportControllerBase with Store {
  AdminService _adminService = AdminService();
  SchoolModel? school = Modular.get<HomeController>().schoolModel;

  @observable
  Classes classReceived =
      Classes(schoolId: '', name: '', room: '', cycleId: '', level: '');

  @observable
  StudentUser studentReceived =
      StudentUser(schoolId: '', name: '', cpf: '', type: 0);

  @action
  initSchoolReport(Classes classes, StudentUser studentUser) async {
    classReceived = classes;
    studentReceived = studentUser;
  }
}
