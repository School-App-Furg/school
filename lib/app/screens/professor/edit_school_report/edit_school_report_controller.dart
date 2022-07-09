import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:mobx/mobx.dart';
import '../../../core/models/model_table.dart';
import '../../../core/components/loader/loader_default.dart';

import '../../../core/models/cycle.dart';
import '../../../core/models/grade.dart';

import '../../../core/service/snackbars.dart';

import '../professor_service.dart';

import '../school_report/school_report_controller.dart';

part 'edit_school_report_controller.g.dart';

class EditSchoolReportController = _EditSchoolReportControllerBase
    with _$EditSchoolReportController;

abstract class _EditSchoolReportControllerBase with Store {
  final ProfessorService _professorService = ProfessorService();
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController noteController = TextEditingController();
  TextEditingController faultsController = TextEditingController();

  //configuração do padrão de avaliação
  List<String>? trimestral = [
    "1º Trimestre",
    "2º Trimestre",
    "3º Trimestre",
    "Exame"
  ];
  List<String>? bimestral = [
    "1º Bimestre",
    "2º Bimestre",
    "3º Bimestre",
    "4º Bimestre",
    "Exame"
  ];

  //Classe sendo inicializada
  @observable
  Cycle? cycleReceived = Cycle(
      name: '',
      idSchool: '',
      approvalPattern: '',
      evaluationStandard: '',
      initialDate: 0,
      finalDate: 0);

  //Classe sendo inicializada
  ModelTable modelTableReceived = ModelTable(periodo: '', nota: '', faltas: '');

  //carregamento inicial dos dados da tela
  @action
  initEditSchoolReport(Cycle cycle, ModelTable modelTable) {
    cycleReceived = cycle;
    modelTableReceived = modelTable;
    if (modelTable.nota != '-') {
      noteController.text = modelTable.nota;
      faultsController.text = modelTable.faltas;
    }
    cycle.evaluationStandard == 'Bimestral'
        ? period = bimestral![int.parse(modelTable.periodo) - 1]
        : period = trimestral![int.parse(modelTable.periodo) - 1];
  }

  //Declaração de variável para controle do período do ciclo
  @observable
  String period = '';

  //Cadastro de notas e faltas
  @action
  insert(BuildContext context, String studentUser, String cycleId,
      String subjectId, String teacherId, String classId) async {
    if (formKey.currentState!.validate()) {
      final loader = LoaderDefault();
      try {
        loader.show();
        final Grade newGrade = Grade(
            student: studentUser,
            cycle: cycleId,
            subject: subjectId,
            note: double.parse(noteController.text),
            timeCourse: int.parse(modelTableReceived.periodo) - 1,
            faults: int.parse(faultsController.text),
            teacher: teacherId,
            classe: classId);
        final bool inserted = await _professorService.insertGrade(newGrade);
        if (inserted) {
          Modular.get<SchoolReportController>().getGrades();
          loader.hide();
          Modular.to.pop();
          buildSnackBarUi(context, "Nota/falta(s) cadastrada(s) com sucesso!");
        } else {
          loader.hide();
          buildSnackBarUi(context, "Registros não atualizados corretamente!");
        }
      } catch (e) {
        loader.hide();
        buildSnackBarUi(context, e.toString());
      }
    }
  }

  //Atualização de notas e faltas
  @action
  update(BuildContext context, String gradeId) async {
    if (formKey.currentState!.validate()) {
      final loader = LoaderDefault();
      try {
        loader.show();
        final bool inserted = await _professorService.updateGrade(
          gradeId,
          double.parse(noteController.text),
          int.parse(faultsController.text),
        );
        if (inserted) {
          Modular.get<SchoolReportController>().getGrades();
          loader.hide();
          Modular.to.pop();
          buildSnackBarUi(context, "Nota/falta(s) atualizada(s) com sucesso!");
        } else {
          loader.hide();
          buildSnackBarUi(context, "Registros não atualizados corretamente!");
        }
      } catch (e) {
        loader.hide();
        buildSnackBarUi(context, e.toString());
      }
    }
  }
}
