import 'package:flutter/material.dart';
import 'screens/splash/splash_screen.dart';

import 'screens/auth/forgot_password/forgot.dart';
import 'screens/auth/login/login_screen.dart';
import 'screens/auth/register/register.dart';
import 'screens/auth/welcome/welcome.dart';
import 'screens/home/home.dart';

class Run extends StatefulWidget {
  @override
  _RunState createState() => _RunState();
}

class _RunState extends State<Run> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'School',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: Colors.grey[100],
      ),
      home: Splash(),
      routes: {
        '/home': (context) => Home(),
        '/login': (context) => LoginScreen(),
        '/welcome': (context) => Welcome(),
        '/register': (context) => Register(),
        '/forgot': (context) => ForgotPasswordScreen(),
      },
      initialRoute: '/',
    );
  }
}
