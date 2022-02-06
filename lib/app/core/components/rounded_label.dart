import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../styles/sizes.dart';

class RoundedLabel extends StatelessWidget {
  final String value;

  const RoundedLabel({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          border: Border.all(color: blue, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      height: height(context, .06),
      width: width(context, .85),
      child: Center(
        child: Text(
          value,
          style: TextStyle(color: grey, fontSize: width(context, .045)),
        ),
      ),
    );
  }
}
