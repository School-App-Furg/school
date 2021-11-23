import 'package:flutter/material.dart';

class MyDropDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: DropdownButton(
        isExpanded: true,
        items: ['A', 'B', 'C', 'D'].map((String value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (_) {},
      ),
    );
  }
}
