import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final TextEditingController controller;
  final bool isPassword;
  final bool isEmail;

  MyTextFormField({
    required this.hintText,
    required this.validator,
    this.isPassword = false,
    this.isEmail = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        obscureText: isPassword ? true : false,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      ),
    );
  }
}