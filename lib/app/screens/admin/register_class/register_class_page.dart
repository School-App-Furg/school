import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../../../core/components/loader/loader_page.dart';
import '../../../core/form/general_form.dart';
import '../../../core/form/multi_select.dart';
import '../../../core/service/validators.dart';
import '../../../core/styles/colors.dart';
import 'register_class_controller.dart';

class RegisterClassPage extends StatefulWidget {
  @override
  State<RegisterClassPage> createState() => _RegisterClassPageState();
}

class _RegisterClassPageState
    extends ModularState<RegisterClassPage, RegisterClassController> {
  @override
  void initState() {
    controller.getSubjectsAndTeachers();
    controller.getStudents();
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
                  title: Text('Cadastro de turmas'),
                ),
                body: SingleChildScrollView(
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        MyTextFormField(
                          hintText: 'ID da turma',
                          controller: controller.nameController,
                          validator: validateEmpty,
                        ),
                        MyTextFormField(
                          hintText: 'Informe a sala desta turma',
                          controller: controller.roomController,
                          validator: validateEmpty,
                          keyboardType: TextInputType.number,
                        ),
                        MyTextFormField(
                          hintText: 'Informe o ano desta turma',
                          controller: controller.yearController,
                          keyboardType: TextInputType.number,
                          validator: validateEmpty,
                        ),
                        MultiSelect(
                            buttonText: "Alunos desta turma",
                            title: "Selecione os alunos:",
                            items: controller.students
                                .map((e) => MultiSelectItem(e.id, e.name))
                                .toList(),
                            onConfirm: controller.setStudentsSelected),
                        MultiSelect(
                          buttonText: "Disciplinas/Profº desta turma",
                          title: "Selecione as disciplinas:",
                          items: controller.subjectTeacher
                              .map((e) => MultiSelectItem(
                                  e, '${e.subject} - ${e.teacher}'))
                              .toList(),
                          onConfirm: controller.setSubjectsSelected,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent,
                          ),
                          onPressed: () => controller.cadastrar(context),
                          child: Text(
                            'Cadastrar',
                            style: TextStyle(
                              color: defaultWhite,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
