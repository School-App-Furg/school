import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../../core/models/cycle.dart';
import '../../../core/models/grade.dart';
import '../../../core/models/school_model.dart';
import '../../../core/models/subject_teacher.dart';
import '../../../core/styles/colors.dart';
import '../aluno_service.dart';
import '../home_page/home_controller.dart';
import 'components/model_table.dart';
import 'components/result_model.dart';

part 'student_report_controller.g.dart';

class StudentReportController = _StudentReportControllerBase
    with _$StudentReportController;

abstract class _StudentReportControllerBase with Store {
  AlunoService _alunoService = AlunoService();
  SchoolModel? school = Modular.get<HomeController>().schoolModel;
  @observable
  bool loading = false;

  @observable
  List<Grade> grades = [];

  @observable
  Cycle? cycle = Cycle(
      name: '',
      idSchool: '',
      approvalPattern: '',
      evaluationStandard: '',
      initialDate: 0,
      finalDate: 0);

  @action
  initStudentReport(String studentId, SubjectTeacher subjectTeacher) async {
    loading = true;
    cycle = await _alunoService.getCurrentCycle(school!.currentCycle);
    grades = await _alunoService.getGradesForSubject(
        studentId, school!.currentCycle, subjectTeacher.idSubject);
    loading = false;
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

  Color getColorGrade(String nota, List<Grade> grade, String approvalPattern) {
    Color cor;
    if (grade.length == 4) {
      double media =
          double.parse((approvalPattern.replaceAll(RegExp('%'), ''))) / 10;
      if (double.parse(nota) >= media) {
        cor = green;
      } else {
        cor = red;
      }
    } else {
      cor = Colors.black;
    }
    return cor;
  }
}
