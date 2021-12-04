import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import '../../../core/form/general_form.dart';
import '../../../core/form/multi_select.dart';
import '../../../core/service/validators.dart';
import 'register_class_controller.dart';

class RegisterClassPage extends StatefulWidget {
  @override
  State<RegisterClassPage> createState() => _RegisterClassPageState();
}

class _RegisterClassPageState extends State<RegisterClassPage> {
  final RegisterClassController _controller = RegisterClassController();
  @override
  void initState() {
    _controller.getStudents();
    _controller.getSubjectsAndTeachers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de turmas'),
      ),
      body: SingleChildScrollView(
        child: Observer(
          builder: (_) {
            return Form(
              key: _controller.formKey,
              child: Column(
                children: [
                  MyTextFormField(
                    hintText: 'Nome da turma',
                    controller: _controller.nameController,
                    validator: validateEmpty,
                  ),
                  MyTextFormField(
                    hintText: 'Informe a sala desta turma',
                    controller: _controller.roomController,
                    validator: validateEmpty,
                    keyboardType: TextInputType.number,
                  ),
                  MyTextFormField(
                    hintText: 'Informe o ano desta turma',
                    controller: _controller.yearController,
                    keyboardType: TextInputType.number,
                    validator: validateEmpty,
                  ),
                  MultiSelect(
                      buttonText: "Selecione os alunos desta turma",
                      title: "Selecione os alunos:",
                      items: _controller.students
                          .map((e) => MultiSelectItem(e, e.name))
                          .toList(),
                      onConfirm: _controller.setStudentsSelected),
                  Observer(
                    builder: (_) {
                      return MultiSelect(
                        buttonText:
                            "Selecione as disciplinas/professores desta turma",
                        title: "Selecione as disciplinas:",
                        items: _controller.subjectTeacher
                            .map((e) => MultiSelectItem(
                                e, '${e.subject} - ${e.teacher}'))
                            .toList(),
                        onConfirm: _controller.setSubjectsSelected,
                      );
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                    ),
                    onPressed: () => _controller.cadastrar(context),
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(
                        color: Colors.white,
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
  }
}
