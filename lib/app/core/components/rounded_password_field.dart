import 'package:flutter/material.dart';
import '../styles/colors.dart';

import 'text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;

  final String hintSenha;
  final String? Function(String?)? validator;
  RoundedPasswordField({
    Key? key,
    required this.onChanged,
    required this.validator,
    required this.hintSenha,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: _obscureText,
        validator: widget.validator,
        onChanged: widget.onChanged,
        cursorColor: blue,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintSenha,
          icon: Icon(
            Icons.lock,
            color: primary,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: new Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off),
          ),
        ),
      ),
    );
  }
}
