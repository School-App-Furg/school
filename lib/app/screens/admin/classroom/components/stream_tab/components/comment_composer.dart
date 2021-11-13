import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../classroom_controller.dart';

class CommentComposer extends StatefulWidget {
  final ClassroomController controller;

  const CommentComposer({Key? key, required this.controller}) : super(key: key);
  @override
  _CommentComposerState createState() => _CommentComposerState();
}

class _CommentComposerState extends State<CommentComposer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.controller.commentList.length,
        itemBuilder: (context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 0)]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10),
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              "${widget.controller.commentList[index]}"),
                        ),
                        SizedBox(width: 10),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.controller.commentList[index].userName,
                                style: TextStyle(),
                              ),
                              Text(
                                widget.controller.commentList[index].date,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ]),
                      ],
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.grey,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
                Container(
                    width: MediaQuery.of(context).size.width - 40,
                    margin: EdgeInsets.only(left: 15, top: 15, bottom: 10),
                    child: Text(widget.controller.commentList[index].comment)),
              ],
            ),
          );
        },
      ),
    );
  }
}
