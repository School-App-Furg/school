import 'package:flutter/material.dart';

import '../styles/sizes.dart';

import '../styles/colors.dart';

class RoundedDropdown extends StatelessWidget {
  final String value;
  final Function(String?) onChanged;
  final String hint;
  final List<DropdownMenuItem<String>> items;

  const RoundedDropdown({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.hint,
    required this.items,
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
      child: DropdownButton<String>(
          value: value == '' ? null : value,
          isExpanded: true,
          hint: Text(
            hint,
            style: TextStyle(color: grey),
          ),
          icon: const Icon(Icons.arrow_drop_down),
          style: const TextStyle(color: grey),
          underline: SizedBox(),
          onChanged: onChanged,
          items: items),
    );
  }
}
