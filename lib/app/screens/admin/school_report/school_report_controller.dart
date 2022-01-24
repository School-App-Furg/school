import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:school/app/core/models/classes.dart';
import 'package:school/app/core/models/cycle.dart';
import 'package:school/app/core/models/grade.dart';
import 'package:school/app/core/models/school_model.dart';

import '../admin_service.dart';
import '../home_page/home_controller.dart';
import 'components/model_table.dart';
import 'components/result_model.dart';

part 'school_report_controller.g.dart';

class SchoolReportController = _SchoolReportControllerBase
    with _$SchoolReportController;

abstract class _SchoolReportControllerBase with Store {
  AdminService _adminService = AdminService();
  SchoolModel? school = Modular.get<HomeController>().schoolModel;
  @observable
  bool loading = false;

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
    loading = true;
    classReceived = classes;
    cycle = await _adminService.getCurrentCycle(school!.currentCycle);
    grades = await _adminService.getGrades(studentId, classes.cycleId);
    loading = false;
  }

  @action
  List<Grade> filterGrades(String subject, String teacher) {
    List<Grade> lista = [];
    grades.forEach((element) {
      if (element.subject == subject && element.teacher == teacher)
        lista.add(element);
    });
    return lista;
  }

  List<ModelTable> setGrades(int numberOfLines, List<Grade> grade) {
    List<ModelTable> list = [];
    grade.forEach((element) {
      list.add(ModelTable(
          periodo: element.timeCourse.toString(),
          nota: element.note.toString(),
          faltas: element.faults.toString()));
    });
    for (var a = 0; a < (numberOfLines - grade.length); a++) {
      list.add(ModelTable(
          periodo: (grade.length + (a + 1)).toString(),
          nota: '-',
          faltas: '-'));
    }
    return list;
  }

  ResultModel calculate(List<Grade> grade, int numberOfLines) {
    num average = 0;
    num faults = 0;
    grade.forEach((element) {
      average = average + element.note.toInt();
      faults = faults + element.faults.toInt();
    });
    average = average / numberOfLines;
    return ResultModel(note: average.toString(), faults: faults.toString());
  }
}
