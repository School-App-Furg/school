import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/components/already_have_an_account_button.dart';
import '../../../core/components/rounded_button.dart';
import '../../../core/components/rounded_input.dart';
import '../../../core/styles/colors.dart';
import '../../../core/styles/sizes.dart';
import 'forgot_controller.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final ForgotController _controller = ForgotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: heightAll(context),
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/images/signup_top.png",
                width: width(context, 0.35),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                "assets/images/login_bottom.png",
                width: width(context, 0.25),
              ),
            ),
            SingleChildScrollView(
              child: Form(
                key: _controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/welcome_ok.png",
                      height: widthAll(context),
                    ),
                    /* SvgPicture.asset(
                      "assets/icons/welcome2.svg",
                      height: widthAll(context),
                    ),*/
                    Text(
                      "RECUPERAR SENHA",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: height(context, 0.01),
                    ),
                    RoundedInput(
                      hintText: "Seu e-mail",
                      controller: _controller.emailController,
                      icon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    RoundedButton(
                      text: "RECEBER INSTRUÇÕES",
                      onpressed: () => _controller.recuperarSenha(context),
                      textColor: primary,
                    ),
                    SizedBox(
                      height: height(context, 0.03),
                    ),
                    AlreadyHaveAnAccountCheck(
                        login: false,
                        press: () => Modular.to.pushNamed("./login")),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
