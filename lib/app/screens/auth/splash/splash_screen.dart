import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:school/app/core/styles/sizes.dart';

import '../../../core/service/navigation.dart';
import '../../repository/auth_repository.dart';

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
        final auth = Provider.of<AuthRepository>(context, listen: false);
        Future.delayed(
          const Duration(seconds: 2),
          () {
            if (auth.usuario == null) {
              navigateToWelcomePage(context);
            } else {
              navigateToHomePage(context);
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.graduationCap,
            size: 70,
            color: Colors.black26,
          ),
          SizedBox(
            height: width(context, .4),
          ),
          CircularProgressIndicator(
            color: Colors.black26,
          )
        ],
      ),
    );
  }
}
