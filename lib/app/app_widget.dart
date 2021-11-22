import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School',
      theme: ThemeData(
          visualDensity: VisualDensity
              .adaptivePlatformDensity, // se adapta a plataforma e prioriza a densidade - melhora a qualidade do texto
          backgroundColor: Colors.grey[100]),
      initialRoute: '/',
      builder: asuka.builder,
      navigatorObservers: [asuka.asukaHeroController],
      debugShowCheckedModeBanner: false,
    ).modular();
  }
}