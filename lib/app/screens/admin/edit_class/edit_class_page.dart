import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:school/app/core/styles/colors.dart';

import '../../../core/components/label_text.dart';
import '../../../core/components/loader/loader_page.dart';
import '../../../core/form/general_form.dart';
import '../../../core/form/multi_select.dart';
import '../../../core/models/classes.dart';
import '../../../core/service/validators.dart';
import 'edit_class_controller.dart';

class EditClassPage extends StatefulWidget {
  final Classes classes;

  const EditClassPage({
    Key? key,
    required this.classes,
  }) : super(key: key);
  @override
  State<EditClassPage> createState() => _EditClassPageState();
}

class _EditClassPageState
    extends ModularState<EditClassPage, EditClassController> {
  @override
  void initState() {
    controller.initEditClass(widget.classes);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return controller.loadingTest
            ? LoaderPage()
            : Scaffold(
                appBar: AppBar(
                  title: Text('Edição de Turmas'),
                ),
                body: SingleChildScrollView(
                  child: Observer(
                    builder: (_) {
                      return Form(
                        key: controller.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LabelText(
                              text: 'ID da turma:',
                            ),
                            MyTextFormField(
                              hintText: 'ID da turma',
                              controller: controller.nameController,
                              validator: validateEmpty,
                            ),
                            LabelText(
                              text: 'Sala:',
                            ),
                            MyTextFormField(
                              hintText: 'Informe a sala desta turma',
                              controller: controller.roomController,
                              validator: validateEmpty,
                              keyboardType: TextInputType.number,
                            ),
                            LabelText(
                              text: 'Ano:',
                            ),
                            MyTextFormField(
                              hintText: 'Informe o ano desta turma',
                              controller: controller.yearController,
                              keyboardType: TextInputType.number,
                              validator: validateEmpty,
                            ),
                            MultiSelect(
                                buttonText: "Selecione os alunos desta turma",
                                title: "Selecione os alunos:",
                                items: controller.students
                                    .map((e) => MultiSelectItem(e, e.name))
                                    .toList(),
                                onConfirm: controller.setStudentsSelected,
                                initialValue:
                                    controller.listOfStudentsSelected),
                            MultiSelect(
                              buttonText:
                                  "Selecione as disciplinas/professores desta turma",
                              title: "Selecione as disciplinas:",
                              items: controller.subjectTeacher
                                  .map((e) => MultiSelectItem(
                                      e, '${e.subject} - ${e.teacher}'))
                                  .toList(),
                              onConfirm: controller.setSubjectsSelected,
                              initialValue:
                                  controller.listOfSubjectTeachersSelected,
                            ),
                            Center(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blueAccent,
                                ),
                                onPressed: () {
                                  controller.update(context);
                                },
                                child: Text(
                                  'Atualizar',
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
