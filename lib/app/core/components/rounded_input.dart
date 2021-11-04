import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../styles/colors.dart';
import 'text_field_container.dart';

class RoundedInput extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final String? errorText;
  final List<TextInputFormatter>? mask;
  final TextInputType? keyboardType;

  const RoundedInput({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    this.errorText,
    this.mask,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: onChanged,
        cursorColor: blue,
        keyboardType: keyboardType,
        inputFormatters: mask,
        decoration: InputDecoration(
          errorText: errorText,
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
