import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school/app/core/components/already_have_an_account_button.dart';
import 'package:school/app/core/components/rounded_button.dart';
import 'package:school/app/core/components/rounded_input.dart';
import 'package:school/app/core/service/validations.dart';
import 'package:school/app/core/styles/colors.dart';
import 'package:school/app/core/styles/sizes.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  final TextEditingController emailCntrlr = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
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
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/welcome2.svg",
                      height: widthAll(context),
                    ),
                    Text(
                      "RECUPERAR SENHA",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: height(context, 0.01),
                    ),
                    RoundedInput(
                      hintText: "Seu e-mail",
                      controller: emailCntrlr,
                      validator: validateEmail,
                      onChanged: (value) {},
                      icon: Icons.mail,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    RoundedButton(
                      text: "RECEBER INSTRUÇÕES",
                      onpressed: () {},
                      textColor: primary,
                    ),
                    SizedBox(
                      height: height(context, 0.03),
                    ),
                    AlreadyHaveAnAccountCheck(
                      login: false,
                      press: () {},
                    ),
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
