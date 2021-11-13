import 'package:flutter/material.dart';
import '../../classroom_controller.dart';

import 'components/profile_tile.dart';

class PeopleTab extends StatefulWidget {
  final ClassroomController controller;

  const PeopleTab({Key? key, required this.controller}) : super(key: key);
  @override
  _PeopleTabState createState() => _PeopleTabState();
}

class _PeopleTabState extends State<PeopleTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 30, left: 15, bottom: 10),
          child: Text(
            "Professores",
            style: TextStyle(
                fontSize: 30, color: Colors.redAccent, letterSpacing: 1),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15),
          width: MediaQuery.of(context).size.width - 30,
          height: 2,
          color: Colors.redAccent,
        ),
        Profile(
          name: widget.controller.classRoomList[0].professor,
        ),
        SizedBox(width: 30),
        Container(
          padding: EdgeInsets.only(top: 30, left: 15, bottom: 10),
          child: Text(
            "Alunos",
            style: TextStyle(
                fontSize: 30, color: Colors.redAccent, letterSpacing: 1),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15),
          width: MediaQuery.of(context).size.width - 30,
          height: 2,
          color: Colors.redAccent,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: widget.controller.commentList.length,
            itemBuilder: (context, int index) {
              return Profile(
                name: widget.controller.commentList[index].userName,
              );
            },
          ),
        )
      ],
    );
  }
}
