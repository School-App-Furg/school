import 'package:flutter/material.dart';
import 'package:school/app/core/styles/colors.dart';
import 'package:school/app/screens/home/home_details/widgets/comment_composer.dart';

class StreamTab extends StatefulWidget {
  NetworkImage bannerImg;
  String disciplina;

  StreamTab({required this.bannerImg, required this.disciplina});

  @override
  _StreamTabState createState() => _StreamTabState();
}

class _StreamTabState extends State<StreamTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Image(
                  image: widget.bannerImg,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 200,
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.only(bottom: 40, left: 30),
                child: Text(
                  widget.disciplina,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              )
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 3)]),
            child: Row(
              children: [
                SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: blue,
                ),
                SizedBox(width: 10),
                Text(
                  "Compartilhar na turma...",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            )),
        CommentComposer(),
      ],
    );
  }
}
