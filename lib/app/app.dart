import 'package:flutter/material.dart';
import 'package:school/app/screens/splash/splash_screen.dart';
import 'screens/auth/login/login_screen.dart';
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
      ),
      home: Splash(context),
      routes: {
        '/home': (context) => Home(),
        '/login': (context) => Login(),
      },
      initialRoute: '/',
    );
  }
}
