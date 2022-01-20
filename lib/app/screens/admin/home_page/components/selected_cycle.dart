import 'package:flutter/material.dart';
import 'package:school/app/core/styles/colors.dart';

class SelectedCyclePeriod extends StatelessWidget {
  final Function()? onTap;
  final String cycleName;
  const SelectedCyclePeriod({Key? key, this.onTap, required this.cycleName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(15.0),
        height: 40.0,
        width: 400.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0), color: defaultblue),
        child: Center(
          child: Text(
            cycleName,
            style: TextStyle(
                color: white, fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
