import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/models/cycle.dart';
import '../../../core/models/grade.dart';
import '../../../core/models/model_table.dart';
import '../../../core/models/result_model.dart';
import '../../../core/models/subject_teacher.dart';
import '../../../core/styles/colors.dart';
import '../aluno_service.dart';

part 'student_report_controller.g.dart';

class StudentReportController = _StudentReportControllerBase
    with _$StudentReportController;

abstract class _StudentReportControllerBase with Store {
  final AlunoService _alunoService = AlunoService();

  //bool para acompanhamento do carregamento da requisição
  @observable
  bool loading = false;

  //notas do aluno
  @observable
  List<Grade> grades = [];

  //carregamento das notas do aluno
  @action
  initStudentReport(
      String studentId, SubjectTeacher subjectTeacher, Cycle cycle) async {
    loading = true;
    grades = await _alunoService.getGradesForSubject(
      studentId,
      cycle.id!,
      subjectTeacher.idSubject,
    );
    loading = false;
  }

  //transforma as notas no objeto usado para mostrar a nota
  List<ModelTable> setGrades(int numberOfLines, List<Grade> grade) {
    final List<ModelTable> list = [];
    for (var a = 0; a < numberOfLines; a++) {
      list.add(ModelTable(
          id: '', periodo: (a + 1).toString(), nota: '-', faltas: '-'));
    }
    for (final element in grade) {
      list[element.timeCourse.toInt()] = ModelTable(
          id: element.id,
          periodo: (element.timeCourse + 1).toString(),
          nota: element.note.toString(),
          faltas: element.faults.toString());
    }
    return list;
  }

  //calcula a média do aluno
  @action
  ResultModel calculate(List<Grade> grade, int numberOfLines) {
    num average = 0;
    num faults = 0;
    final List<Grade> list = [];
    for (final element in grade) {
      if (element.timeCourse == numberOfLines) {
        list.add(element);
      }
    }
    for (final element in list) {
      grade.remove(element);
    }
    for (final element in grade) {
      average = average + element.note.toDouble();
      faults = faults + element.faults.toInt();
    }
    average = average / numberOfLines;
    return ResultModel(
        note: average.toStringAsFixed(2), faults: faults.toString());
  }

  //Seleção de cor no caso média, trimestre ou bimestre e padrão de aprovação
  Color getColorGrade(String nota, List<Grade> grade, String approvalPattern,
      String evaluationStandard, bool isExam) {
    Color cor = Colors.black;
    double media;

    if (isExam) {
      media = 5;
    } else {
      media = double.parse((approvalPattern.replaceAll(RegExp('%'), ''))) / 10;
    }
    if (nota != '-') {
      if (evaluationStandard == 'Bimestral') {
        if (grade.length >= 4) {
          if (double.parse(nota) >= media) {
            cor = green;
          } else {
            cor = red;
          }
        }
      } else {
        if (grade.length >= 3) {
          if (double.parse(nota) >= media) {
            cor = green;
          } else {
            cor = red;
          }
        }
      }
    }
    return cor;
  }
}
