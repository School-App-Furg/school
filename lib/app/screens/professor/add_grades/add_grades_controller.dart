import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/components/loader/loader_default.dart';
import '../../../core/models/classes.dart';
import '../../../core/models/cycle.dart';
import '../../../core/models/grade.dart';
import '../../../core/models/student_user.dart';
import '../../../core/models/subject_teacher.dart';
import '../../../core/service/snackbars.dart';
import '../professor_service.dart';
import '../school_report/school_report_controller.dart';

part 'add_grades_controller.g.dart';

class AddGradesController = _AddGradesControllerBase with _$AddGradesController;

abstract class _AddGradesControllerBase with Store {
  ProfessorService _professorService = ProfessorService();
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController noteController = TextEditingController();
  TextEditingController faultsController = TextEditingController();

  @observable
  bool loading = false;

  late Cycle cycle;

  late SubjectTeacher subjectTeacher;

  late List<Grade> grades;

  @action
  initAddGrades(Classes classeReceived, Cycle cycleReceived,
      SubjectTeacher subjectTeacherReceived, List<Grade> gradesReceived) async {
    loading = true;
    cycle = cycleReceived;
    classe = classeReceived;
    grades = gradesReceived;
    subjectTeacher = subjectTeacherReceived;
    loading = false;
  }

  @observable
  Classes classe =
      Classes(schoolId: '', name: '', room: '', cycleId: '', level: '');

  @observable
  List<StudentUser> students = [];

  //lista de ids de estudantes selecionados
  @observable
  List<String> studentsSelected = [];

  //recebe os valores selecionados no multiSelect dos students
  @action
  setStudentsSelected(List values) {
    studentsSelected.clear();
    values.forEach(
      (element) {
        studentsSelected.add(element.id);
      },
    );
  }

  @observable
  List<StudentUser> listOfStudentsSelected = [];

  //configuração do padrão de avaliação
  List periodBimestre = [
    '1º Bimestre',
    '2º Bimestre',
    '3º Bimestre',
    '4º Bimestre',
    'Exame'
  ];

  List periodTrimestre = [
    '1º Trimestre',
    '2º Trimestre',
    '3º Trimestre',
    'Exame'
  ];

  @observable
  String cyclePeriod = '';

  @action
  int getCyclePeriod(String e) {
    int b = 0;
    if (cycle.evaluationStandard == 'Bimestral') {
      for (var a = 0; a < periodBimestre.length; a++) {
        if (periodBimestre[a] == e) {
          b = a;
        }
      }
    } else {
      for (var a = 0; a < periodTrimestre.length; a++) {
        if (periodTrimestre[a] == e) {
          b = a;
        }
      }
    }
    return b;
  }

  @action
  setCycleSelected(e) {
    cyclePeriod = e;
  }

  @action
  insert(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      final loader = LoaderDefault();
      try {
        loader.show();

        bool inserted = await registerGrades();

        if (inserted) {
          Modular.get<SchoolReportController>().getGrades();
          loader.hide();
          Modular.to.pop();
          buildSnackBarUi(context, "Cadastro de notas realizado!");
        } else {
          loader.hide();
          buildSnackBarUi(
              context, "O cadastro de notas não foi realizado corretamente!");
        }
      } catch (e) {
        loader.hide();
        buildSnackBarUi(context, e.toString());
      }
    }
  }

  Future<bool> registerGrades() async {
    List<String> toRemove = [];
    studentsSelected.forEach(
      (elementStudent) {
        grades.forEach(
          (elementGrade) async {
            if (elementGrade.student == elementStudent &&
                elementGrade.timeCourse == getCyclePeriod(cyclePeriod) &&
                elementGrade.classe == classe.id!) {
              toRemove.add(elementStudent);
              await _professorService.updateGrade(
                elementGrade.id!,
                double.parse(noteController.text),
                int.parse(faultsController.text),
              );
            }
          },
        );
      },
    );
    toRemove.forEach((element) {
      studentsSelected.remove(element);
    });
    studentsSelected.forEach((element) async {
      await _professorService.insertGrade(
        Grade(
            student: element,
            cycle: cycle.id!,
            subject: subjectTeacher.idSubject,
            note: double.parse(noteController.text),
            timeCourse: getCyclePeriod(cyclePeriod),
            faults: int.parse(faultsController.text),
            teacher: subjectTeacher.idTeacher,
            classe: classe.id!),
      );
    });

    return true;
  }
}
