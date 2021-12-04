import 'package:flutter/material.dart';
import '../../../core/form/general_form.dart';
import '../../../core/service/validators.dart';
import 'register_subjects_controller.dart';

class RegisterSubjectsPage extends StatelessWidget {
  final RegisterSubjectsController _controller = RegisterSubjectsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de disciplinas'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _controller.formKey,
          child: Column(
            children: [
              MyTextFormField(
                hintText: 'Nome da disciplina',
                controller: _controller.nameController,
                validator: validateEmpty,
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
