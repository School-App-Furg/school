import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/admin/home_page/home_page.dart';
import 'screens/repository/auth_repository.dart';

import 'screens/auth/welcome/welcome.dart';
import 'screens/auth/login/login_screen.dart';
import 'screens/auth/splash/splash_screen.dart';
import 'screens/auth/forgot_password/forgot.dart';
import 'screens/auth/register/register.dart';

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
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthRepository()),
        ],
        child: Splash(),
      ),
      routes: {
        '/home': (context) => HomePage(),
        '/login': (context) => LoginScreen(),
        '/welcome': (context) => Welcome(),
        '/register': (context) => Register(),
        '/forgot': (context) => ForgotPasswordScreen(),
      },
      initialRoute: '/',
    );
  }
}
