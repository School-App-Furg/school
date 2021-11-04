import 'package:flutter/material.dart';
import '../styles/colors.dart';

class ForgotPassword extends StatelessWidget {
  final Function press;
  const ForgotPassword({
    Key? key,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Esqueceu a sua senha? ",
          style: TextStyle(color: primary),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            "Clique aqui",
            style: TextStyle(
              color: primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
