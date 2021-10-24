import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../styles/sizes.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      width: width(context, 0.8),
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(29),
          border: Border.all(color: blue, width: 1.5)),
      child: child,
    );
  }
}
