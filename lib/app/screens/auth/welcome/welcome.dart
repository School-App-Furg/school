import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:school/app/core/components/rounded_welcome_button.dart';

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
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "BEM VINDO AO SCHOOL",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: height(context, 0.05)),
                  Image.asset(
                    "assets/images/welcome_ok.png",
                    width: widthAll(context),
                  ),
                  SizedBox(
                    height: height(context, 0.05),
                  ),
                  RoundedButton(
                      text: "LOGIN",
                      textColor: white,
                      onpressed: () => Modular.to.navigate("./login")),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Text(
                      "CADASTRAR",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black45),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedWelcomeButton(
                            text: "ESCOLA",
                            textColor: primary,
                            onpressed: () =>
                                Modular.to.navigate("./register-school"),
                          ),
                          RoundedWelcomeButton(
                              text: "PROFESSOR",
                              textColor: primary,
                              onpressed: () => {}),
                          RoundedWelcomeButton(
                              text: "ALUNO",
                              textColor: primary,
                              onpressed: () => {}),
                        ],
                      ),
                    ]),
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
