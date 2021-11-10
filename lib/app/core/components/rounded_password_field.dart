import 'package:flutter/material.dart';

import 'text_field_container.dart';

import '../styles/colors.dart';

class RoundedPasswordField extends StatefulWidget {
  final String hintSenha;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final VoidCallback onTap;

  RoundedPasswordField({
    Key? key,
    required this.hintSenha,
    required this.controller,
    this.validator,
    required this.obscureText,
    required this.onTap,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: widget.obscureText,
        cursorColor: black,
        controller: widget.controller,
        validator: widget.validator,
        decoration: InputDecoration(
          errorStyle: TextStyle(height: 0.05),
          border: InputBorder.none,
          hintText: widget.hintSenha,
          icon: Icon(
            Icons.lock,
            color: primary,
          ),
          suffixIcon: GestureDetector(
            onTap: widget.onTap,
            child: new Icon(
                widget.obscureText ? Icons.visibility_off : Icons.visibility),
          ),
        ),
      ),
    );
  }
}
