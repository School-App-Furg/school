import 'package:flutter/material.dart';

//fornece mensagens breves sobre os processos do aplicativo na parte inferior da tela
void buildSnackBarUi(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
