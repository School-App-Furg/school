import 'package:flutter/material.dart';

import 'package:school/app/core/form/general_form.dart';
import 'package:school/app/core/service/validators.dart';

import 'register_student_controller.dart';

class RegisterStudentPage extends StatefulWidget {
  @override
  State<RegisterStudentPage> createState() => _RegisterStudentPageState();
}

class _RegisterStudentPageState extends State<RegisterStudentPage> {
  final RegisterStudentController _controller = RegisterStudentController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Alunos'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _controller.formKey,
          child: Column(
            children: [
              MyTextFormField(
                hintText: 'Nome completo do aluno',
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
        ),
      ),
    );
  }
}
