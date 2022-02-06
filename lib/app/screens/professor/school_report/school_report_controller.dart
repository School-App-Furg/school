import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../../core/models/model_table.dart';
import '../../../core/models/result_model.dart';
import '../../../core/models/student_user.dart';
import '../../../core/models/subject_teacher.dart';
import '../home_page/home_controller.dart';
import '../professor_service.dart';
import '../../../core/models/classes.dart';
import '../../../core/models/cycle.dart';
import '../../../core/models/grade.dart';
import '../../../core/models/school_model.dart';
import '../../../core/styles/colors.dart';

part 'school_report_controller.g.dart';

class SchoolReportController = _SchoolReportControllerBase
    with _$SchoolReportController;

abstract class _SchoolReportControllerBase with Store {
  ProfessorService _professorService = ProfessorService();
  SchoolModel? school = Modular.get<HomeController>().schoolModel;

  @observable
  bool loading = false;

  @observable
  Classes classReceived =
      Classes(schoolId: '', name: '', room: '', cycleId: '', level: '');

  @observable
  Cycle? cycle = Cycle(
      name: '',
      idSchool: '',
      approvalPattern: '',
      evaluationStandard: '',
      initialDate: 0,
      finalDate: 0);

  @observable
  SubjectTeacher subjectTeacherReceived =
      SubjectTeacher(idSubject: '', subject: '', idTeacher: '', teacher: '');

  @action
  initSchoolReport(Classes classe, SubjectTeacher subjectTeacher,
      Cycle cycleReceived) async {
    loading = true;
    classReceived = classe;
    subjectTeacherReceived = subjectTeacher;
    students = await _professorService.getStudentsForClass(classe.students!);
    grades = await _professorService.getGradesForTeacher(
        classReceived.students!,
        classReceived.cycleId,
        subjectTeacherReceived.idSubject,
        subjectTeacherReceived.idTeacher);
    cycle = cycleReceived;
    loading = false;
  }

  @observable
  ObservableList<Grade> grades = ObservableList();

  @action
  getGrades() async {
    loading = true;
    grades = await _professorService.getGradesForTeacher(
        classReceived.students!,
        classReceived.cycleId,
        subjectTeacherReceived.idSubject,
        subjectTeacherReceived.idTeacher);
    loading = false;
  }

  @observable
  List<StudentUser> students = [];

  @action
  List<Grade> filterGrades(String idStudent) {
    List<Grade> lista = [];
    grades.forEach((element) {
      if (element.student == idStudent) lista.add(element);
    });
    return lista;
  }

  @action
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
