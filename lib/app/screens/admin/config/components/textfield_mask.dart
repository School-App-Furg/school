import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:school/app/core/service/validators.dart';

class MaskTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  const MaskTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        validator: validateEmpty,
        inputFormatters: [
          MaskTextInputFormatter(
            mask: '##,##',
          ),
        ],
        decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.all(15.0),
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.grey[200],
            labelText: labelText),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
