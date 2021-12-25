import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:school/app/screens/admin/admin_service.dart';
import 'package:school/app/screens/admin/home_page/home_controller.dart';
import '../../../core/models/subject.dart';

part 'school_report_controller.g.dart';

class SchoolReportController = _SchoolReportControllerBase
    with _$SchoolReportController;

abstract class _SchoolReportControllerBase with Store {
  AdminService _adminService = AdminService();
  String schoolId = Modular.get<HomeController>().userAdmin!.schoolId;

  //lista de disciplinas da escola
  @observable
  List<Subject>? subjects = [];

  //listagem de disciplinas da escola
  @action
  getSubjects() async {
    subjects = await _adminService.getSubjects(schoolId);
  }
}
