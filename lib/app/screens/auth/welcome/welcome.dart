import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/service/navigation.dart';

import '../../../core/components/rounded_button.dart';
import '../../../core/styles/colors.dart';
import '../../../core/styles/sizes.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: heightAll(context),
        width: widthAll(context),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset("assets/images/main_bottom.png",
                  width: width(context, 0.2)),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "BEM VINDO AO SCHOOL",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: height(context, 0.05)),
                  SvgPicture.asset("assets/icons/welcome2.svg",
                      width: widthAll(context)),
                  SizedBox(
                    height: height(context, 0.05),
                  ),
                  RoundedButton(
                      text: "LOGIN",
                      textColor: white,
                      onpressed: () => navigateToLoginPage(context)),
                  RoundedButton(
                    text: "CADASTRE SUA ESCOLA",
                    textColor: primary,
                    onpressed: () => navigateToRegisterPage(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
