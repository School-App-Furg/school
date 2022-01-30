import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';

class AlertDialogConfirmation extends StatelessWidget {
  final Function() onPressed;
  const AlertDialogConfirmation({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      title: Text(
        'Excluir Turma',
        textAlign: TextAlign.center,
      ),
      content: SingleChildScrollView(
        child: Text(
          'Tem certeza que deseja excluir a turma? Esta ação NÃO poderá ser revertida!',
          textAlign: TextAlign.center,
        ),
      ),
      actions: [
        TextButton(
          onPressed: onPressed,
          child: Text(
            "Sim",
            style: TextStyle(color: white),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(blue),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "Não",
            style: TextStyle(color: white),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(blue),
          ),
        ),
      ],
    );
  }
}
