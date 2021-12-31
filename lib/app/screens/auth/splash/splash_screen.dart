import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../auth_service.dart';
import '../../../resources/auth_repository.dart';

import '../../../core/styles/sizes.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(
      (timeStamp) async {
        AuthRepository auth = Modular.get<AuthRepository>();
        Future.delayed(
          const Duration(seconds: 2),
          () async {
            if (auth.usuario == null) {
              Modular.to.pushNamed("/auth/");
            } else {
              int type = await _authService.getUserType(auth.usuario!.uid);
              if (type == 0) {
                Modular.to.pushReplacementNamed("/admin/");
              } else if (type == 1) {
                Modular.to.pushReplacementNamed("/professor/");
              } else if (type == 2) {
                Modular.to.pushReplacementNamed("/aluno/");
              }
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF5f9bbb),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.graduationCap,
            size: width(context, .21),
            color: Color(0xFFdbdbdb),
          ),
          SizedBox(
            height: width(context, .10),
          ),
          SizedBox(
            width: width(context, .10),
            height: width(context, .10),
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
