import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/service/navigation.dart';

class Splash extends StatelessWidget {
  bool isLogged = true;
  Splash(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (isLogged) {
          navigateToHomePage(context);
        } else {
          navigateToLoginPage(context);
        }
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFf2f2f2),
      child: Center(
        child: Icon(
          FontAwesomeIcons.school,
          size: 70,
          color: Color(0xFFdbdbdb),
        ),
      ),
    );
  }
}
