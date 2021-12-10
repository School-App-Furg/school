import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:school/app/core/models/cycle.dart';
import 'package:school/app/core/models/subject.dart';
import 'package:school/app/resources/cycle_repository.dart';
import 'package:school/app/resources/grades_repository.dart';
import 'package:school/app/screens/admin/home_page/home_controller.dart';

import '../admin_service.dart';

part 'school_report_controller.g.dart';

class SchoolReportController = _SchoolReportControllerBase
    with _$SchoolReportController;

abstract class _SchoolReportControllerBase with Store {
  AdminService _adminService = AdminService();
  String schoolId = Modular.get<HomeController>().userAdmin!.schoolId;
  GradesRepository _gradesRepository = GradesRepository();
  CycleRepository _cycleRepository = CycleRepository();

  //lista de disciplinas da escola
  @observable
  List<Subject>? subjects = [];

  //listagem de disciplinas da escola
  @action
  getSubjects() async {
    subjects = await _adminService.getSubjects(schoolId);
  }
}
