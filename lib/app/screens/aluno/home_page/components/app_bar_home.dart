import 'package:flutter/material.dart';
import '../../../../core/models/school_model.dart';
import '../../../../core/models/student_user.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  final Function()? onPressedDrawer;

  final Function()? onPressedHistoric;
  final SchoolModel? schoolModel;
  final StudentUser? studentUser;

  const AppBarHome(
      {Key? key,
      required this.onPressedDrawer,
      this.onPressedHistoric,
      this.schoolModel,
      this.studentUser})
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
        schoolModel!.name + " - " + studentUser!.name,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 17,
        ),
      ),
      actions: [
        IconButton(
          onPressed: onPressedHistoric,
          icon: const Icon(Icons.more_vert),
          color: Colors.black,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
