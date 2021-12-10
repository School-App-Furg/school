import 'package:flutter/material.dart';

import '../../../core/form/general_form.dart';

import '../../../core/service/validators.dart';
import 'register_manager_controller.dart';

class RegisterManagerPage extends StatefulWidget {
  @override
  State<RegisterManagerPage> createState() => _RegisterManagerPageState();
}

class _RegisterManagerPageState extends State<RegisterManagerPage> {
  final RegisterManagerController _controller = RegisterManagerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Auxiliares'),
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
