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
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: width(context, 0.8),
      decoration: BoxDecoration(
        color: blue,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
