import 'package:flutter/material.dart';
import 'package:school/app/core/styles/colors.dart';

class PeriodCard extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final String datepicker;
  const PeriodCard(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.datepicker})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Container(
          child: Row(
            children: [
              Icon(
                Icons.date_range,
                color: defaultblue,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                datepicker,
              ),
            ],
          ),
        ),
        trailing: TextButton(
          child: Text(
            text,
            style: TextStyle(color: defaultblue),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
