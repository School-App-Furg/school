import 'package:flutter/material.dart';
import 'package:school/app/core/styles/colors.dart';
import 'package:school/app/core/styles/sizes.dart';

class AppBarReport extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final String textButton;
  final Function()? onPressed;
  final Function()? onPressedSubject;
  final Function()? onPressedHistoric;

  const AppBarReport(
      {Key? key,
      required this.text,
      this.onPressedSubject,
      this.onPressedHistoric,
      required this.onPressed,
      required this.textButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        text,
      ),
      actions: [
        TextButton.icon(
          label: Text(textButton),
          icon: Icon(Icons.receipt_sharp),
          onPressed: onPressed,
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(white),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
