import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import '../../../core/models/grade.dart';

import '../../../core/components/label_text.dart';
import '../../../core/components/loader/loader_page.dart';
import '../../../core/components/rounded_dropdown.dart';
import '../../../core/form/general_form.dart';
import '../../../core/form/multi_select.dart';
import '../../../core/models/classes.dart';
import '../../../core/models/cycle.dart';
import '../../../core/models/student_user.dart';
import '../../../core/models/subject_teacher.dart';
import '../../../core/service/validators.dart';
import '../../../core/styles/colors.dart';

import 'add_grades_controller.dart';

class AddGradesPage extends StatefulWidget {
  final Classes classe;
  final Cycle cycle;
  final SubjectTeacher subjectTeacher;
  final List<StudentUser> listOfStudents;
  final List<Grade> grades;
  const AddGradesPage({
    Key? key,
    required this.classe,
    required this.cycle,
    required this.subjectTeacher,
    required this.listOfStudents,
    required this.grades,
  }) : super(key: key);
  @override
  State<AddGradesPage> createState() => _AddGradesPageState();
}

class _AddGradesPageState
    extends ModularState<AddGradesPage, AddGradesController> {
  @override
  void initState() {
    controller.initAddGrades(
        widget.classe, widget.cycle, widget.subjectTeacher, widget.grades);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return controller.loading
            ? LoaderPage()
            : Scaffold(
                appBar: AppBar(
                  title: Text('Cadastro de notas'),
                ),
                body: SingleChildScrollView(
                  child: Observer(
                    builder: (_) {
                      return Form(
                        key: controller.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: RoundedDropdown(
                                value: controller.cyclePeriod,
                                onChanged: controller.setCycleSelected,
                                hint: "Selecione o período:",
                                items: widget.cycle.evaluationStandard ==
                                        'Bimestral'
                                    ? controller.periodBimestre
                                        .map<DropdownMenuItem<String>>(
                                        (e) {
                                          return DropdownMenuItem<String>(
                                            value: e,
                                            child: Text(e),
                                          );
                                        },
                                      ).toList()
                                    : controller.periodTrimestre
                                        .map<DropdownMenuItem<String>>(
                                        (e) {
                                          return DropdownMenuItem<String>(
                                            value: e,
                                            child: Text(e),
                                          );
                                        },
                                      ).toList(),
                              ),
                            ),
                            LabelText(
                              text: 'Nota:',
                            ),
                            MyTextFormField(
                              mask: [
                                (FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9.]{0,4}$')))
                              ],
                              hintText: 'Insira a nota',
                              controller: controller.noteController,
                              validator: validateNote10,
                              keyboardType: TextInputType.number,
                            ),
                            LabelText(
                              text: 'Total de faltas:',
                            ),
                            MyTextFormField(
                              mask: [
                                MaskTextInputFormatter(
                                  mask: '##',
                                  filter: {"#": RegExp(r'[0-9]')},
                                )
                              ],
                              hintText: 'Insira as faltas',
                              controller: controller.faultsController,
                              validator: validateEmpty,
                              keyboardType: TextInputType.number,
                            ),
                            LabelText(
                              text: 'Alunos:',
                            ),
                            MultiSelect(
                                buttonText: "Selecione os alunos desta turma",
                                title: "Selecione os alunos:",
                                items: widget.listOfStudents
                                    .map((e) => MultiSelectItem(e, e.name))
                                    .toList(),
                                onConfirm: controller.setStudentsSelected,
                                initialValue:
                                    controller.listOfStudentsSelected),
                            Center(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blueAccent,
                                ),
                                onPressed: () {
                                  controller.insert(context);
                                },
                                child: Text(
                                  'Cadastrar',
                                  style: TextStyle(
                                    color: defaultWhite,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
      },
    );
  }
}
