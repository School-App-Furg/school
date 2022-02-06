import 'package:flutter/material.dart';

class RightTextProfile extends StatelessWidget {
  final String name;

  const RightTextProfile({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
              ),
            ],
          )
        ],
      ),
    );
  }
}
