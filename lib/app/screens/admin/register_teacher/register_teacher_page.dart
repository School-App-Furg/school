import 'package:flutter/material.dart';
import 'package:school/app/core/form/dropdown.dart';
import 'package:school/app/core/form/general_form.dart';
import 'package:school/app/core/service/validators.dart';
import 'register_teacher_controller.dart';

class RegisterTeacherPage extends StatelessWidget {
  final RegisterTeacherController _controller = RegisterTeacherController();

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
                validator: validateName,
              ),
              MyTextFormField(
                hintText: 'Email',
                isEmail: true,
                controller: _controller.emailController,
                validator: validateEmail,
              ),

              //Turmas alocadas
              MyDropDown(),
              //Disciplina alocada
              MyDropDown(),
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

      /**/
    );
  }
}
