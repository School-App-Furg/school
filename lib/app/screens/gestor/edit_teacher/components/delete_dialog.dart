import 'package:flutter/material.dart';

import '../edit_teacher_controller.dart';

Future<void> showDeleteTeacherDialog(BuildContext context,
    EditTeacherController controller, String? idTeacher) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        title: const Text('Excluir'),
        content: SingleChildScrollView(
          child: Text('Você tem certeza que deseja excluir?'),
        ),
        actions: [
          TextButton(
            child: const Text('Sim'),
            onPressed: () {
              controller.excluir(context, idTeacher!);
            },
          ),
          TextButton(
            child: const Text('Não'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
