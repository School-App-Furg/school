import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:school/app/core/form/general_form.dart';

import 'package:school/app/core/service/validators.dart';
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
  }

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
