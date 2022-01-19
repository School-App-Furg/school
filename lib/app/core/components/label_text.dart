import 'package:flutter/material.dart';
import '../styles/sizes.dart';

class LabelText extends StatelessWidget {
  final String text;
  const LabelText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.only(left: 10.0, top: 10),
      child: Text(
        text,

        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey[700],
          fontSize: width(context, .04),
        ),
      ),
    );
  }
}
