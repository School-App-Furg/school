import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

showAlert(BuildContext context, VoidCallback confirmPress) {
  Widget confirm = TextButton(
    child: Text("Confirmar"),
    onPressed: () {
      confirmPress();
      Navigator.maybePop(context);
    },
  );

  Widget cancel = TextButton(
    child: Text("Cancelar"),
    onPressed: () {
      Modular.to.maybePop();
    },
  );

  AlertDialog alerta = AlertDialog(
    elevation: 2,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0))),
    title: Text(
      "ATENÇÃO:",
      style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800),
      textAlign: TextAlign.center,
    ),
    content: Text(
        "Tem certeza que deseja excluir? Esta ação não poderá ser revertida!"),
    actions: [confirm, cancel],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}
