import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import '../../../../core/form/general_form.dart';
import '../../../../core/form/multi_select.dart';
import '../../../../core/service/validators.dart';
import '../../../../core/styles/sizes.dart';

import '../register_teacher_controller.dart';

Future<void> showEditTeacherDialog(
    BuildContext context, RegisterTeacherController controller) async {
  return await showDialog(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            content: Container(
              width: width(context, .8),
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyTextFormField(
                      hintText: 'Nome completo',
                      controller: controller.nameController,
                      validator: validateEmpty,
                    ),
                    MyTextFormField(
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.emailController,
                      validator: validateEmail,
                    ),
                    Observer(
                      builder: (_) {
                        return MultiSelect(
                          buttonText: "Selecione as disciplinas:",
                          title: "Selecione as disciplinas:",
                          items: controller.subjects!
                              .map((e) => MultiSelectItem(e, e.name))
                              .toList(),
                          onConfirm: controller.setSubjectsSelected,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            title: Text('Editar professor'),
            actions: [
              TextButton(
                child: const Text('Atualizar'),
                onPressed: () {
                  controller.update(context);
                },
              ),
            ],
          );
        },
      );
    },
  );
}
