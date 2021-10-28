import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../styles/colors.dart';
import 'text_field_container.dart';

class RoundedInput extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? mask;
  const RoundedInput(
      {Key? key,
      required this.hintText,
      required this.icon,
      required this.onChanged,
      this.validator,
      this.mask,
      this.keyboardType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        inputFormatters: mask,
        onChanged: onChanged,
        validator: validator,
        cursorColor: blue,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: primary,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
