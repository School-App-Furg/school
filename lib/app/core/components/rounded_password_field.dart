import 'package:flutter/material.dart';
import 'text_field_container.dart';
import '../service/validations.dart';
import '../styles/colors.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String? hintSenha;
  final String? errorText;
  RoundedPasswordField({
    Key? key,
    required this.onChanged,
    required this.hintSenha,
    required this.errorText,
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
        validator: validateSenha,
        onChanged: widget.onChanged,
        cursorColor: black,
        decoration: InputDecoration(
          errorText: widget.errorText,
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
                _obscureText ? Icons.visibility_off : Icons.visibility),
          ),
        ),
      ),
    );
  }
}
