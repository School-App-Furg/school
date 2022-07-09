import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/models/classes.dart';
import '../../../core/models/cycle.dart';
import '../../../core/models/grade.dart';
import '../../../core/models/model_table.dart';
import '../../../core/models/result_model.dart';
import '../../../core/models/school_model.dart';
import '../../../core/styles/colors.dart';
import '../admin_service.dart';
import '../home_page/home_controller.dart';

part 'school_report_controller.g.dart';

class SchoolReportController = _SchoolReportControllerBase
    with _$SchoolReportController;

abstract class _SchoolReportControllerBase with Store {
  final AdminService _adminService = AdminService();
  SchoolModel? school = Modular.get<HomeController>().schoolModel;
  @observable
  bool loading = false;

  //Classe sendo inicializada
  @observable
  Classes classes =
      Classes(schoolId: '', name: '', room: '', cycleId: '', level: '');

  //Lista de notas
  @observable
  List<Grade> grades = [];

  //Classe sendo inicializada
  @observable
  Cycle? cycle = Cycle(
      name: '',
      idSchool: '',
      approvalPattern: '',
      evaluationStandard: '',
      initialDate: 0,
      finalDate: 0);

  //Solicita as informações do relatório ao firebase
  @action
  initSchoolReport(
      Classes classesReceived, String studentId, Cycle cycleReceived) async {
    loading = true;
    classes = classesReceived;
    cycle = cycleReceived;
    grades =
        await _adminService.getGrades(studentId, classes.cycleId, classes.id!);
    loading = false;
  }

  //Listagem dos cards com as notas e faltas de cada disciplinas/professor
  @action
  List<Grade> filterGrades(String subject, String teacher) {
    final List<Grade> lista = [];
    for (final element in grades) {
      if (element.subject == subject && element.teacher == teacher) {
        lista.add(element);
      }
    }
    return lista;
  }

  //Inclusão de notas e faltas considerando se for para bimestre ou trimestre
  @action
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

  //Cálculo da média e somatória de faltas
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
