import 'package:flutter/material.dart';
import '../../../../core/styles/colors.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  final Function()? onPressedDrawer;
  final String text;
  final Function()? onPressedHistoric;

  const AppBarHome({
    Key? key,
    required this.onPressedDrawer,
    required this.text,
    this.onPressedHistoric,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.5,
      leading: IconButton(
        onPressed: onPressedDrawer,
        icon: const Icon(Icons.menu),
        color: Colors.black,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: black,
          fontWeight: FontWeight.w500,
          fontSize: 17,
        ),
      ),
      actions: [
        IconButton(
          onPressed: onPressedHistoric,
          icon: const Icon(Icons.more_vert),
          color: black,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
