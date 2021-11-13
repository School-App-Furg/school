import 'package:flutter/material.dart';
import '../styles/colors.dart';
import '../styles/sizes.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Function()? onpressed;

  const RoundedButton(
      {Key? key,
      required this.text,
      required this.textColor,
      required this.onpressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(context, 0.08),
      margin: EdgeInsets.symmetric(vertical: 10),
      width: width(context, 0.8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
          style:
              ButtonStyle(backgroundColor: MaterialStateProperty.all(primary)),
          onPressed: onpressed,
          child: Text(
            text,
            style: TextStyle(
              color: white,
              fontWeight: FontWeight.w900,
              fontSize: width(context, 0.040),
            ),
          ),
        ),
      ),
    );
  }
}
