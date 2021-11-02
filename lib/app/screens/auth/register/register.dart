import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/components/already_have_an_account_button.dart';
import '../../../core/components/rounded_button.dart';
import '../../../core/components/rounded_input.dart';
import '../../../core/service/validations.dart';
import '../../../core/styles/colors.dart';
import '../../../core/styles/sizes.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
  final TextEditingController emailCntrlr = TextEditingController();
  final TextEditingController passCntrlr = TextEditingController();
  final TextEditingController nomeCntrlr = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: heightAll(context),
        width: widthAll(context),
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
              left: 0,
              child: Image.asset(
                "assets/images/main_bottom.png",
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
                      "CADASTRE A SUA ESCOLA",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RoundedInput(
                      hintText: "Nome da Escola",
                      controller: nomeCntrlr,
                      validator: validateEmptyField,
                      onChanged: (value) {},
                      icon: Icons.school,
                      errorText: "",
                    ),
                    RoundedInput(
                      hintText: "CNPJ",
                      controller: emailCntrlr,
                      validator: validateEmail,
                      onChanged: (value) {},
                      icon: Icons.description_outlined,
                      errorText: "",
                    ),
                    RoundedInput(
                      hintText: "Cidade",
                      controller: emailCntrlr,
                      validator: validateEmail,
                      onChanged: (value) {},
                      icon: Icons.location_city,
                      errorText: "",
                    ),
                    RoundedInput(
                      hintText: "E-mail",
                      controller: emailCntrlr,
                      validator: validateEmail,
                      onChanged: (value) {},
                      icon: Icons.email,
                      errorText: "",
                    ),
                    /*RoundedPasswordField(
                      controller: passCntrlr,
                      validator: validateSenha,
                      onChanged: (String value) {},
                    ),*/
                    RoundedButton(
                      text: "CADASTRAR",
                      onpressed: () {},
                      textColor: blue,
                    ),
                    SizedBox(
                      height: height(context, 0.05),
                      child: AlreadyHaveAnAccountCheck(
                        login: false,
                        press: () {},
                      ),
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
