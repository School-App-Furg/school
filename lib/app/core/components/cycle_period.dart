import 'package:flutter/material.dart';

import '../styles/colors.dart';

class CyclePeriod extends StatelessWidget {
  final String label;

  const CyclePeriod({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: EdgeInsets.all(1.0),
      label: Text(
        label,
        style: TextStyle(
          color: white,
        ),
      ),
      backgroundColor: defaultblue,
      elevation: 3.0,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(7.0),
    );
  }
}
