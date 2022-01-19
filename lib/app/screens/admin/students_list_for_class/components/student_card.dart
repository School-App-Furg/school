import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/models/student_user.dart';
import '../../../../core/styles/colors.dart';

class StudentCard extends StatefulWidget {
  final StudentUser studentUser;
  const StudentCard({
    Key? key,
    required this.studentUser,
  }) : super(key: key);

  @override
  State<StudentCard> createState() => _StudentCardState();
}

class _StudentCardState extends State<StudentCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 3),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(14.0),
          ),
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
            trailing:
                Icon(Icons.keyboard_arrow_right, color: blueicon, size: 30.0),
            onTap: () {
              Modular.to.pushNamed('./school-report');
            },
          ),
        ),
      ),
    );
  }
}
