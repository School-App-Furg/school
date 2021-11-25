import 'package:flutter/material.dart';
import 'package:school/app/core/form/dropdown.dart';
import 'package:school/app/core/form/general_form.dart';
import 'register_student_controller.dart';

class RegisterStudentPage extends StatelessWidget {
  final RegisterStudentController controller = RegisterStudentController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Alunos'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              /*MyTextFormField(
                hintText: 'Nome completo',
                validator: (String value) {}, 
              ),
              MyTextFormField(
                hintText: 'Email',
                isEmail: true,
                validator: (String value) {},
              ),*/

              //Turmas alocadas
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
