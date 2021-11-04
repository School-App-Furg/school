import 'package:flutter/material.dart';

void navigateToLoginPage(BuildContext context) {
  Navigator.of(context).pushNamed('/login');
}

void navigateToHomePage(BuildContext context) {
  Navigator.pushNamed(context, '/home');
}

void navigateToWelcomePage(BuildContext context) {
  Navigator.pushNamed(context, '/welcome');
}

void navigateToRegisterPage(BuildContext context) {
  Navigator.pushNamed(context, '/register');
}

void navigateToForgotPage(BuildContext context) {
  Navigator.pushNamed(context, '/forgot');
}
