import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/form/general_form.dart';
import '../../../core/models/classes.dart';
import '../../../core/service/validators.dart';
import 'edit_class_controller.dart';

class EditClassPage extends StatefulWidget {
  final Classes classes;

  const EditClassPage({
    Key? key,
    required this.classes,
  }) : super(key: key);
  @override
  State<EditClassPage> createState() => _EditClassPageState();
}

class _EditClassPageState extends State<EditClassPage> {
  final EditClassController _controller = EditClassController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edição de Turmas'),
      ),
      body: SingleChildScrollView(
        child: Observer(
          builder: (_) {
            return Form(
              key: _controller.formKey,
              child: Column(
                children: [
                  MyTextFormField(
                    hintText: '${widget.classes.level}º ano',
                    //Inclui o roomController somente para reproduzir o valor acima no form
                    controller: _controller.roomController,
                    validator: validateEmail,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Atualizar',
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
