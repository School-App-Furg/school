import 'package:flutter/material.dart';

import '../../../../core/models/student_user.dart';
import '../../../../core/styles/colors.dart';

class StudentCard extends StatefulWidget {
  final StudentUser studentUser;
  final Function()? onTap;
  const StudentCard({
    Key? key,
    required this.studentUser,
    this.onTap,
  }) : super(key: key);

  @override
  State<StudentCard> createState() => _StudentCardState();
}

class _StudentCardState extends State<StudentCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: defaultWhite,
      child: Container(
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 17.0),
          title: Text(
            widget.studentUser.name,
            style: TextStyle(color: darkGrey, fontWeight: FontWeight.bold),
          ),
          leading: Container(
            height: 40,
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(Icons.person_rounded, color: blueicon),
          ),
          trailing: Icon(Icons.keyboard_arrow_right, size: 30.0),
          onTap: widget.onTap,
        ),
      ),
    );
  }
}
