import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';
import '../../../core/models/model_table.dart';
import '../../../core/models/result_model.dart';

import '../../../core/models/cycle.dart';
import '../../../core/models/grade.dart';

import '../../../core/models/subject_teacher.dart';
import '../../../core/styles/colors.dart';
import '../aluno_service.dart';

part 'student_report_controller.g.dart';

class StudentReportController = _StudentReportControllerBase
    with _$StudentReportController;

abstract class _StudentReportControllerBase with Store {
  AlunoService _alunoService = AlunoService();

  @observable
  bool loading = false;

  @observable
  List<Grade> grades = [];

  @action
  initStudentReport(
      String studentId, SubjectTeacher subjectTeacher, Cycle cycle) async {
    loading = true;
    grades = await _alunoService.getGradesForSubject(
        studentId, cycle.id!, subjectTeacher.idSubject);
    loading = false;
  }

  List<ModelTable> setGrades(int numberOfLines, List<Grade> grade) {
    List<ModelTable> list = [];
    for (var a = 0; a < numberOfLines; a++) {
      list.add(ModelTable(
          id: '', periodo: (a + 1).toString(), nota: '-', faltas: '-'));
    }
    grade.forEach((element) {
      list[element.timeCourse.toInt()] = ModelTable(
          id: element.id,
          periodo: (element.timeCourse + 1).toString(),
          nota: element.note.toString(),
          faltas: element.faults.toString());
    });
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

  Color getColorGradeExame(
      String nota, List<Grade> grade, String approvalPattern) {
    Color cor;
    if (grade.length == 4) {
      double exame = 5;
      if (double.parse(nota) >= exame) {
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
