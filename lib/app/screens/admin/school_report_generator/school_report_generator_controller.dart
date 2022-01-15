import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/models/student_user.dart';
import '../admin_service.dart';
import '../home_page/home_controller.dart';

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
