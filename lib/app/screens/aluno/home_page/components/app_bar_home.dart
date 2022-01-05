import 'package:flutter/material.dart';
import 'package:school/app/core/models/school_model.dart';
import 'package:school/app/core/models/student_user.dart';
import 'package:school/app/resources/auth_repository.dart';

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
    AuthRepository _authRepository = AuthRepository();
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
