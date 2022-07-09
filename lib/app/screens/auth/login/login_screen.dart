import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/components/already_have_an_account_button.dart';
import '../../../core/components/forgot_password_button.dart';
import '../../../core/components/rounded_button.dart';
import '../../../core/components/rounded_input.dart';
import '../../../core/components/rounded_password_field.dart';
import '../../../core/service/validators.dart';
import '../../../core/styles/colors.dart';
import '../../../core/styles/sizes.dart';
import 'login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          body: SizedBox(
            width: double.infinity,
            height: heightAll(context),
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
                    key: _controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: height(context, 0.03),
                        ),
                        Image.asset(
                          "assets/images/welcome_ok.png",
                          width: widthAll(context),
                        ),
                        Text(
                          "LOGIN",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: height(context, 0.01)),
                        RoundedInput(
                          hintText: "E-mail",
                          keyboardType: TextInputType.emailAddress,
                          controller: _controller.emailController,
                          validator: validateEmail,
                          icon: Icons.email,
                        ),
                        Observer(
                          builder: (_) {
                            return RoundedPasswordField(
                              hintSenha: "Senha",
                              controller: _controller.senhaController,
                              validator: validateSenha,
                              obscureText: _controller.obscureText,
                              onTap: () {
                                _controller.mostrarSenhaUser();
                              },
                            );
                          },
                        ),
                        ForgotPassword(
                            press: () => Modular.to.pushNamed("./forgot")),
                        SizedBox(height: height(context, 0.03)),
                        RoundedButton(
                          text: "LOGIN",
                          textColor: black,
                          onpressed: () => _controller.login(context),
                        ),
                        SizedBox(
                          height: height(context, 0.03),
                        ),
                        AlreadyHaveAnAccountCheck(
                          press: () => Modular.to.navigate("./"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
