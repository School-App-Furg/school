import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

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
    //requisitar lista de disciplinas
    //requisitar lista de turmas
    _controller.getClasses();
    super.initState();
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
                validator: validateName,
              ),
              MyTextFormField(
                hintText: 'Email',
                isEmail: true,
                controller: _controller.emailController,
                validator: validateEmail,
              ),
              Observer(
                builder: (_) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MultiSelectDialogField(
                      buttonText: Text("Selecione as turmas deste professor"),
                      title: Text("Selecione as turmas:"),
                      cancelText: Text("CANCELAR"),
                      items: _controller.classes!
                          .map((e) => MultiSelectItem(e, e.name))
                          .toList(),
                      listType: MultiSelectListType.CHIP,
                      chipDisplay: MultiSelectChipDisplay(
                        onTap: (value) {
                          _controller.classesSelecionadas.remove(value);
                        },
                      ),
                      onConfirm: (values) {
                        _controller.classesSelecionadas = values;
                      },
                    ),
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
