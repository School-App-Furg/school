import 'package:flutter/material.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Text("Editar"),
          value: 1,
        ),
        PopupMenuItem(
          child: Text("Excluir"),
          value: 2,
        )
      ],
    );
  }
}
