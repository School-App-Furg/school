import 'package:flutter/material.dart';
import 'package:school/app/core/colors.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final VoidCallback onpressed;

  const RoundedButton(
      {Key? key,
      required this.text,
      required this.textColor,
      required this.onpressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 20, horizontal: 40)),
              backgroundColor: MaterialStateProperty.all(blue)),
          onPressed: onpressed,
          child: Text(
            text,
            style: TextStyle(color: textColor, fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}
