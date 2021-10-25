import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/service/navigation.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(
      (timeStamp) async {
        //final authStore = Modular.get<AuthStore>();
        final isLogged = false;
        //await authStore.isLogged();
        Future.delayed(
          const Duration(seconds: 2),
          () {
            if (isLogged) {
              navigateToHomePage(context);
            } else {
              navigateToWelcomePage(context);
            }
          },
        );
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
