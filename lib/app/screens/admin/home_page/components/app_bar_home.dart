import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:school/app/core/styles/colors.dart';

import 'different_cycle.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  final Function()? onPressedDrawer;
  final String text;
  final Function()? onPressedSubject;
  final Function()? onPressedHistoric;
  final String cyclePeriod;

  const AppBarHome(
      {Key? key,
      required this.onPressedDrawer,
      required this.text,
      this.onPressedSubject,
      this.onPressedHistoric,
      required this.cyclePeriod})
      : super(key: key);

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
        InkWell(
          child: Visibility(
            child: CyclePeriod(
              label: cyclePeriod,
            ),
            visible: true,
          ),
          onTap: () => Modular.to.pushNamed('./historic'),
        ),
        IconButton(
          onPressed: onPressedSubject,
          icon: const Icon(Icons.add),
          color: black,
        ),
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
