import 'package:flutter/material.dart';

class AppBarReport extends StatelessWidget implements PreferredSizeWidget {
  final String text;

  final Function()? onPressed;
  final Function()? onPressedSubject;
  final Function()? onPressedHistoric;

  const AppBarReport({
    Key? key,
    required this.text,
    this.onPressedSubject,
    this.onPressedHistoric,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        text,
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.receipt_sharp),
          onPressed: onPressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
