import 'package:flutter/material.dart';
import 'package:school/app/core/styles/sizes.dart';
import '../../../../core/form/general_form.dart';
import '../../../../core/service/validators.dart';
import '../register_subjects_controller.dart';

Future<void> showAddSubjectDialog(
    BuildContext context, RegisterSubjectsController controller) async {
  return await showDialog(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            content: SizedBox(
              width: width(context, .8),
              child: Form(
                key: controller.formKey,
                child: MyTextFormField(
                  hintText: 'Nome da disciplina',
                  controller: controller.nameController,
                  validator: validateEmpty,
                ),
              ),
            ),
            title: Text('Cadastrar disciplina'),
            actions: [
              TextButton(
                child: const Text('Cadastrar'),
                onPressed: () {
                  controller.cadastrar(context);
                },
              ),
            ],
          );
        },
      );
    },
  );
}
