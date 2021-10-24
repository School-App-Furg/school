import 'package:flutter/material.dart';
import 'package:school/app/core/components/text_field_container.dart';
import 'package:school/app/core/service/validations.dart';
import 'package:school/app/core/styles/colors.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final Function validator;
  RoundedPasswordField({
    Key? key,
    required this.onChanged,
    required this.controller,
    required this.validator,
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
        controller: widget.controller,
        obscureText: _obscureText,
        validator: validateSenha,
        onChanged: widget.onChanged,
        cursorColor: black,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Senha",
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
                _obscureText ? Icons.visibility_off : Icons.visibility),
          ),
        ),
      ),
    );
  }
}
