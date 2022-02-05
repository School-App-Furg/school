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
        studentId, cycle.id!, subjectTeacher.idSubject);
    loading = false;
  }

  //transforma as notas no objeto usado para mostrar a nota
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

  //calcula a média do aluno
  @action
  ResultModel calculate(List<Grade> grade, int numberOfLines) {
    num average = 0;
    num faults = 0;
    List<Grade> list = [];
    grade.forEach((element) {
      if (element.timeCourse == numberOfLines) {
        list.add(element);
      }
    });
    list.forEach((element) {
      grade.remove(element);
    });
    grade.forEach((element) {
      average = average + element.note.toDouble();
      faults = faults + element.faults.toInt();
    });
    average = average / numberOfLines;
    return ResultModel(
        note: average.toStringAsFixed(2), faults: faults.toString());
  }

  //Seleção de cor no caso média, trimestre ou bimestre e padrão de aprovação
  Color getColorGrade(String nota, List<Grade> grade, String approvalPattern,
      String evaluationStandard) {
    Color cor;
    double media;
    media = double.parse((approvalPattern.replaceAll(RegExp('%'), ''))) / 10;
    if (evaluationStandard == 'Bimestral') {
      if (grade.length == 4) {
        if (double.parse(nota) >= media) {
          cor = green;
        } else {
          cor = red;
        }
      } else {
        cor = Colors.black;
      }
    } else {
      if (grade.length == 3) {
        if (double.parse(nota) >= media) {
          cor = green;
        } else {
          cor = red;
        }
      } else {
        cor = Colors.black;
      }
    }
    return cor;
  }

  //altera a cor com base na nota atingida do exame
  Color getColorGradeExam(
    String nota,
    List<Grade> grade,
    String approvalPattern,
    String evaluationStandard,
  ) {
    Color cor;
    double media;
    media = 5;
    if (evaluationStandard == 'Bimestral') {
      if (grade.length == 4) {
        if (double.parse(nota.replaceAll(RegExp('-'), '5')) >= media) {
          cor = green;
        } else {
          cor = red;
        }
      } else {
        cor = Colors.black;
      }
    } else {
      if (grade.length == 3) {
        if (double.parse(nota.replaceAll(RegExp('-'), '5')) >= media) {
          cor = green;
        } else {
          cor = red;
        }
      } else {
        cor = Colors.black;
      }
    }
    return cor;
  }
}
