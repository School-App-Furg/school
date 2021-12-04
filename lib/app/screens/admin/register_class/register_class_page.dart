import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:school/app/core/form/general_form.dart';
import 'package:school/app/core/form/multi_select.dart';
import 'package:school/app/core/service/validators.dart';

import 'register_class_controller.dart';

class RegisterClassPage extends StatelessWidget {
  final RegisterClassController _controller = RegisterClassController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Professores'),
      ),
      body: SingleChildScrollView(
        child: Observer(
          builder: (_) {
            return Form(
              key: _controller.formKey,
              child: Column(
                children: [
                  MyTextFormField(
                    hintText: 'Nome completo',
                    controller: _controller.nameController,
                    validator: validateName,
                  ),
                  MyTextFormField(
                    hintText: 'Email',
                    isEmail: true,
                    controller: _controller.emailController,
                    validator: validateEmail,
                  ),
                  MultiSelect(
                    buttonText: "Selecione as turmas deste professor",
                    title: "Selecione as turmas:",
                    items: _controller.classes!
                        .map((e) => MultiSelectItem(e, e.name))
                        .toList(),
                    onConfirm: (values) {
                      _controller.classesSelected = values;
                    },
                  ),
                  MultiSelect(
                    buttonText: "Selecione as disciplinas deste professor",
                    title: "Selecione as disciplinas:",
                    items: _controller.subjects!
                        .map((e) => MultiSelectItem(e, e.name))
                        .toList(),
                    onConfirm: (values) {
                      _controller.subjectsSelected = values;
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
