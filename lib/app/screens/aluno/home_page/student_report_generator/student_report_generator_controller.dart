import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/models/student_user.dart';
import '../../aluno_service.dart';
import '../../home_page/home_controller.dart';

part 'student_report_generator_controller.g.dart';

class StudentReportGeneratorController = _StudentReportGeneratorControllerBase
    with _$StudentReportGeneratorController;

abstract class _StudentReportGeneratorControllerBase with Store {
  AlunoService _alunoService = AlunoService();
  String schoolId = Modular.get<HomeController>().userStudent!.schoolId;

  //lista de estudandes da escola
  @observable
  List<StudentUser> students = [];

  //get da lista de estudantes
  @action
  Future getStudents() async {
    students = await _alunoService.getStudentsBySchoolId(schoolId);
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
