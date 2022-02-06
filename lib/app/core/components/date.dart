import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../styles/sizes.dart';

import '../styles/colors.dart';

class BasicDateTimeField extends StatefulWidget {
  final String hintText;
  final DateTime? currentValue;
  final Function(DateTime?)? onChanged;

  BasicDateTimeField({
    Key? key,
    required this.hintText,
    this.currentValue,
    this.onChanged,
  }) : super(key: key);

  @override
  State<BasicDateTimeField> createState() => _BasicDateTimeFieldState();
}

class _BasicDateTimeFieldState extends State<BasicDateTimeField> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DateTimeField(
        decoration: InputDecoration(
          icon: Icon(
            Icons.date_range,
            color: defaultblue,
          ),
          hintText: widget.hintText,
          border: InputBorder.none,
        ),
        initialValue: widget.currentValue,
        format: DateFormat("dd/MM/yyyy"),
        style: TextStyle(fontSize: width(context, 0.037)),
        onChanged: widget.onChanged,
        onShowPicker: (context, currentValue) async {
          DateTime? date = await showDatePicker(
            context: context,
            firstDate: DateTime(2020),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100),
          );
          return date;
        },
      ),
    );
  }
}
