import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:school/app/core/service/validators.dart';
import 'package:school/app/core/styles/colors.dart';

class BasicDateTimeField extends StatelessWidget {
  final Function onChange;
  final format = DateFormat("dd-MM-yyyy HH:mm");
  final String hintText;

  BasicDateTimeField({Key? key, required this.onChange, required this.hintText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          DateTimeField(
              decoration: InputDecoration(
                icon: Icon(
                  Icons.date_range,
                  color: defaultblue,
                ),
                hintText: hintText,
                border: InputBorder.none,
              ),
              format: format,
              validator: validateEmpty,
              onChanged: (value) => onChange(value),
              onShowPicker: (context, currentValue) async {
                final date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2020),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100));
                return date;
              }),
        ],
      ),
    );
  }
}
