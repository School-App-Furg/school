import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../../core/models/model_table.dart';
import '../../../core/models/result_model.dart';
import '../../../core/styles/colors.dart';
import '../../../core/models/classes.dart';
import '../../../core/models/cycle.dart';
import '../../../core/models/grade.dart';
import '../../../core/models/school_model.dart';

import '../admin_service.dart';
import '../home_page/home_controller.dart';

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
      approvalPattern: '',
      evaluationStandard: '',
      initialDate: 0,
      finalDate: 0);

  @action
  initSchoolReport(
      Classes classes, String studentId, Cycle cycleReceived) async {
    loading = true;
    classReceived = classes;
    cycle = cycleReceived;
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
    return ResultModel(
        note: average.toStringAsFixed(2), faults: faults.toString());
  }

  Color getColorGradeBi(
      String nota, List<Grade> grade, String approvalPattern) {
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

  Color getColorGradeExameBi(
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

  Color getColorGradeTri(
      String nota, List<Grade> grade, String approvalPattern) {
    Color cor;
    if (grade.length == 3) {
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

  Color getColorGradeExameTri(
      String nota, List<Grade> grade, String approvalPattern) {
    Color cor;
    if (grade.length == 3) {
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
