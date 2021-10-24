import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school/app/core/components/already_have_an_account_button.dart';
import 'package:school/app/core/components/forgot_password_button.dart';
import 'package:school/app/core/components/rounded_button.dart';
import 'package:school/app/core/components/rounded_input.dart';
import 'package:school/app/core/components/rounded_password_field.dart';
import 'package:school/app/core/service/validations.dart';
import 'package:school/app/core/styles/colors.dart';
import 'package:school/app/core/styles/sizes.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController emailCntrlr = TextEditingController();
  final TextEditingController passCntrlr = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/images/main_top.png",
                width: width(context, 0.35),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                "assets/images/login_bottom.png",
                width: width(context, 0.4),
              ),
            ),
            SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height(context, 0.03),
                    ),
                    SvgPicture.asset(
                      "assets/icons/welcome2.svg",
                      width: widthAll(context),
                    ),
                    Text(
                      "LOGIN",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: height(context, 0.01)),
                    RoundedInput(
                        hintText: "Seu e-mail",
                        controller: emailCntrlr,
                        icon: Icons.mail,
                        onChanged: (value) {},
                        validator: validateEmail),
                    RoundedPasswordField(
                      controller: passCntrlr,
                      validator: validateSenha,
                      onChanged: (String value) {},
                    ),
                    ForgotPassword(
                      press: () {},
                    ),
                    SizedBox(height: height(context, 0.03)),
                    RoundedButton(
                      text: "LOGIN",
                      onpressed: () {},
                      textColor: black,
                    ),
                    SizedBox(
                      height: height(context, 0.03),
                    ),
                    AlreadyHaveAnAccountCheck(
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
