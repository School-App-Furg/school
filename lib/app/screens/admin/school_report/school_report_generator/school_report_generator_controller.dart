import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:school/app/core/models/student_user.dart';
import 'package:school/app/screens/admin/home_page/home_controller.dart';

import '../../admin_service.dart';

part 'school_report_generator_controller.g.dart';

class SchoolReportGeneratorController = _SchoolReportGeneratorControllerBase
    with _$SchoolReportGeneratorController;

abstract class _SchoolReportGeneratorControllerBase with Store {
  AdminService _adminService = AdminService();
  String schoolId = Modular.get<HomeController>().userAdmin!.schoolId;

  //lista de estudandes da escola
  @observable
  List<StudentUser> students = [];

  //get da lista de estudantes
  @action
  Future getStudents() async {
    students = await _adminService.getStudentsBySchoolId(schoolId);
  }

  //lista de ids de estudantes selecionados
  @observable
  List<String> studentsSelected = [];

  //recebe os valores selecionados no multiSelect dos students
  @action
  setStudentsSelected(List values) {
    studentsSelected.clear();
    values.forEach(
      (element) {
        studentsSelected.add(element);
      },
    );
  }
}
