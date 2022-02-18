import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/components/text_field_container.dart';
import '../../../../core/styles/colors.dart';

class RoundedInputProfessor extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final List<TextInputFormatter>? mask;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const RoundedInputProfessor({
    Key? key,
    required this.hintText,
    required this.icon,
    this.mask,
    this.keyboardType,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        enabled: false,
        cursorColor: blue,
        keyboardType: keyboardType,
        inputFormatters: mask,
        controller: controller,
        validator: validator,
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
