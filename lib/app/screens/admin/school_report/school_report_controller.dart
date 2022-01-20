import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:school/app/core/models/classes.dart';
import 'package:school/app/core/models/cycle.dart';
import 'package:school/app/core/models/grade.dart';
import 'package:school/app/core/models/school_model.dart';

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
  List<Grade> grades = [];

  @observable
  Cycle? cycle = Cycle(
      name: '',
      idSchool: '',
      approvalAttendance: '',
      approvalPattern: '',
      evaluationStandard: '',
      initialDate: 0,
      finalDate: 0);

  @action
  initSchoolReport(Classes classes, String studentId) async {
    classReceived = classes;
    cycle = await _adminService.getCurrentCycle(school!.currentCycle);
    grades = await _adminService.getGrades(studentId, classes.cycleId);
  }

  List<Grade> filterGrades(String subject, String teacher) {
    List<Grade> lista = [];
    grades.forEach((element) {
      if (element.subject == subject && element.teacher == teacher)
        lista.add(element);
    });
    return lista;
  }
}
