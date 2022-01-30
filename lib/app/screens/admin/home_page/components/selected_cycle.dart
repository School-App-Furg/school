import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/sizes.dart';

class SelectedCyclePeriod extends StatelessWidget {
  final Function()? onTap;
  final String cycleName;
  const SelectedCyclePeriod({Key? key, this.onTap, required this.cycleName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      decoration: BoxDecoration(color: Colors.red),
      child: Center(
        child: Text(
          cycleName,
          style: TextStyle(
              color: white,
              fontWeight: FontWeight.w600,
              fontSize: width(context, .025)),
        ),
      ),
    );
  }
}
