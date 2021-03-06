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
  final ProfessorService _professorService = ProfessorService();
  GlobalKey<FormState> formKey = GlobalKey();

  //controladores do inputs da tela
  TextEditingController noteController = TextEditingController();
  TextEditingController faultsController = TextEditingController();

  //booleano que acompanha o carregamento
  @observable
  bool loading = false;

  //ciclo recebido
  late Cycle cycle;

  //disciplina com o seu respectivo professor
  late SubjectTeacher subjectTeacher;

  //listagem de notas
  late List<Grade> grades;

  //carregamento inicial da tela
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

  //turma recebida
  @observable
  Classes classe =
      Classes(schoolId: '', name: '', room: '', cycleId: '', level: '');

  //listagem de estudantes
  @observable
  List<StudentUser> students = [];

  //lista de ids de estudantes selecionados
  @observable
  List<String> studentsSelected = [];

  //recebe os valores selecionados no multiSelect dos students
  @action
  setStudentsSelected(List values) {
    studentsSelected.clear();
    for (final element in values) {
      studentsSelected.add(element.id);
    }
  }

  //listagem de aluno selecionados
  @observable
  List<StudentUser> listOfStudentsSelected = [];

  //configura????o do padr??o de avalia????o
  List periodBimestre = [
    '1?? Bimestre',
    '2?? Bimestre',
    '3?? Bimestre',
    '4?? Bimestre',
    'Exame'
  ];

  List periodTrimestre = [
    '1?? Trimestre',
    '2?? Trimestre',
    '3?? Trimestre',
    'Exame'
  ];

  //codigo do ciclo
  @observable
  String cyclePeriod = '';

  @action
  setCycleSelected(e) {
    cyclePeriod = e;
  }

  //pega o o c??digo do periodo
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

  //fun????o de inser????o de notas
  @action
  insert(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      final loader = LoaderDefault();
      try {
        loader.show();
        final bool inserted = await registerGrades();
        if (inserted) {
          Modular.get<SchoolReportController>().getGrades();
          loader.hide();
          Modular.to.pop();
          buildSnackBarUi(context, "Cadastro de notas realizado!");
        } else {
          loader.hide();
          buildSnackBarUi(
              context, "O cadastro de notas n??o foi realizado corretamente!");
        }
      } catch (e) {
        loader.hide();
        buildSnackBarUi(context, e.toString());
      }
    }
  }

  //cadastro de notas
  Future<bool> registerGrades() async {
    final List<String> toRemove = [];
    for (final elementStudent in studentsSelected) {
      for (final elementGrade in grades) {
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
      }
    }
    for (final element in toRemove) {
      studentsSelected.remove(element);
    }
    for (final i in studentsSelected) {
      await _professorService.insertGrade(
        Grade(
          student: i,
          cycle: cycle.id!,
          subject: subjectTeacher.idSubject,
          note: double.parse(noteController.text),
          timeCourse: getCyclePeriod(cyclePeriod),
          faults: int.parse(faultsController.text),
          teacher: subjectTeacher.idTeacher,
          classe: classe.id!,
        ),
      );
    }
    return true;
  }
}
