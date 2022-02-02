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
  ProfessorService _professorService = ProfessorService();

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController noteController = TextEditingController();
  TextEditingController faultsController = TextEditingController();

  List<String>? trimestral = ["1º Trimestre", "2º Trimestre", "3º Trimestre"];
  List<String>? bimestral = [
    "1º Bimestre",
    "2º Bimestre",
    "3º Bimestre",
    "4º Bimestre"
  ];

  @observable
  Cycle? cycleReceived = Cycle(
      name: '',
      idSchool: '',
      approvalPattern: '',
      evaluationStandard: '',
      initialDate: 0,
      finalDate: 0);

  ModelTable modelTableReceived = ModelTable(periodo: '', nota: '', faltas: '');

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

  @observable
  String period = '';

  @action
  insert(BuildContext context, String studentUser, String cycleId,
      String subjectId, String teacherId, String classId) async {
    if (formKey.currentState!.validate()) {
      final loader = LoaderDefault();
      try {
        loader.show();
        Grade newGrade = Grade(
            student: studentUser,
            cycle: cycleId,
            subject: subjectId,
            note: double.parse(noteController.text),
            timeCourse: int.parse(modelTableReceived.periodo) - 1,
            faults: int.parse(faultsController.text),
            teacher: teacherId,
            classe: classId);
        bool inserted = await _professorService.insertGrade(newGrade);
        if (inserted) {
          Modular.get<SchoolReportController>().getGrades();
          loader.hide();
          Modular.to.pop();
          buildSnackBarUi(context, "Turma cadastrada com sucesso!");
        } else {
          loader.hide();
          buildSnackBarUi(context, "A turma não foi cadastrada corretamente!");
        }
      } catch (e) {
        loader.hide();
        buildSnackBarUi(context, e.toString());
      }
    }
  }

  @action
  update(BuildContext context, String gradeId) async {
    if (formKey.currentState!.validate()) {
      final loader = LoaderDefault();
      try {
        loader.show();
        bool inserted = await _professorService.updateGrade(
          gradeId,
          double.parse(noteController.text),
          int.parse(faultsController.text),
        );
        if (inserted) {
          Modular.get<SchoolReportController>().getGrades();
          loader.hide();
          Modular.to.pop();
          buildSnackBarUi(context, "Nota atualizada com sucesso!");
        } else {
          loader.hide();
          buildSnackBarUi(context, "A nota não foi atualizada corretamente!");
        }
      } catch (e) {
        loader.hide();
        buildSnackBarUi(context, e.toString());
      }
    }
  }
}
