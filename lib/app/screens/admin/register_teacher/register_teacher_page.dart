import 'package:flutter/material.dart';
import 'package:school/app/core/form/dropdown.dart';
import 'package:school/app/core/form/general_form.dart';
import 'register_teacher_controller.dart';

class RegisterTeacherPage extends StatelessWidget {
  final RegisterTeacherController controller = RegisterTeacherController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Usuários'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              MyTextFormField(
                hintText: 'Nome completo',
                validator: (String value) {},
              ),
              MyTextFormField(
                hintText: 'Email',
                isEmail: true,
                validator: (String value) {},
              ),
              MyTextFormField(
                hintText: 'Senha',
                isPassword: true,
                validator: (String value) {},
              ),
              MyDropDown(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                ),
                onPressed: () {},
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
