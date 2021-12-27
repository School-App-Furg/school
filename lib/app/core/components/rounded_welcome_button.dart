import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../styles/sizes.dart';

class RoundedWelcomeButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Function()? onpressed;

  const RoundedWelcomeButton(
      {Key? key,
      required this.text,
      required this.textColor,
      required this.onpressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(context, 0.08),
      margin: EdgeInsets.all(10),
      width: width(context, 0.29),
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
