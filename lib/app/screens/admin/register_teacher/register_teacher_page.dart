import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../core/form/general_form.dart';
import '../../../core/form/multi_select.dart';

import '../../../core/service/validators.dart';
import 'register_teacher_controller.dart';

class RegisterTeacherPage extends StatefulWidget {
  @override
  State<RegisterTeacherPage> createState() => _RegisterTeacherPageState();
}

class _RegisterTeacherPageState extends State<RegisterTeacherPage> {
  final RegisterTeacherController _controller = RegisterTeacherController();

  @override
  void initState() {
    super.initState();
    _controller.getSubjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Professores'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _controller.formKey,
          child: Column(
            children: [
              MyTextFormField(
                hintText: 'Nome completo',
                controller: _controller.nameController,
                validator: validateEmpty,
              ),
              MyTextFormField(
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                controller: _controller.emailController,
                validator: validateEmail,
              ),
              Observer(
                builder: (_) {
                  return MultiSelect(
                    buttonText:
                        "Selecione as disciplinas lecionadas por este professor:",
                    title: "Selecione as disciplinas:",
                    items: _controller.subjects!
                        .map((e) => MultiSelectItem(e, e.name))
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
        ),
      ),
    );
  }
}
