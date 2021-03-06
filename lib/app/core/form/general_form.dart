import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextFormField extends StatelessWidget {
  final List<TextInputFormatter>? mask;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool isPassword;
  final Icon? icon;
  final String? labelText;

  final TextInputType keyboardType;

  const MyTextFormField({
    Key? key,
    required this.hintText,
    required this.validator,
    required this.controller,
    this.labelText,
    this.icon,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.mask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        inputFormatters: mask,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
            icon: icon,
            hintText: hintText,
            contentPadding: EdgeInsets.all(10.0),
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.grey[200],
            labelText: labelText),
        obscureText: isPassword ? true : false,
        keyboardType: keyboardType,
      ),
    );
  }
}
