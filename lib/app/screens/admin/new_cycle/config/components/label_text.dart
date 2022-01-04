import 'package:flutter/material.dart';
import '../../../../../core/styles/sizes.dart';

class LabelText extends StatelessWidget {
  final String text;
  const LabelText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey[700],
          fontSize: width(context, .04),
        ),
      ),
    );
  }
}
