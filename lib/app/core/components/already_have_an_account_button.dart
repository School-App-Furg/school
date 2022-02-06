import 'package:flutter/material.dart';

import '../styles/colors.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            login ? "Ainda não possui uma conta ? " : "Já possui uma conta ? ",
            style: TextStyle(color: darkGrey),
          ),
          GestureDetector(
            onTap: press,
            child: Text(
              login ? "Cadastre-se" : "Acesse",
              style: TextStyle(
                color: primary,
                fontWeight: FontWeight.w800,
              ),
            ),
          )
        ],
      ),
    );
  }
}
