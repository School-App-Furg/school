import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school/app/core/components/rounded_password_field.dart';
import 'package:school/app/screens/auth/register/register_controller.dart';
import '../../../core/components/already_have_an_account_button.dart';
import '../../../core/components/rounded_button.dart';
import '../../../core/components/rounded_input.dart';
import '../../../core/service/validations.dart';
import '../../../core/styles/colors.dart';
import '../../../core/styles/sizes.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegisterController _controller = RegisterController();
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
            SingleChildScrollView(child: Observer(
              builder: (_) {
                return Form(
                  key: _controller.formKey,
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
                          validator: validateEmptyField,
                          onChanged: _controller.setNomeEscola,
                          icon: Icons.school),
                      Visibility(
                        visible: _controller.nomeEscolaError,
                        child: Text("Deu ruim"),
                      ),
                      RoundedInput(
                        hintText: "CNPJ",
                        validator: validateEmail,
                        onChanged: _controller.setCnpj,
                        icon: Icons.description_outlined,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(),
                      ),
                      RoundedInput(
                        hintText: "E-mail",
                        validator: validateEmail,
                        onChanged: _controller.setEmail,
                        icon: Icons.email,
                      ),
                      RoundedPasswordField(
                        validator: validateSenha,
                        hintSenha: "Senha",
                        onChanged: _controller.setSenha,
                      ),
                      RoundedPasswordField(
                        validator: validateSenha,
                        hintSenha: "Confirmar Senha",
                        onChanged: _controller.setSenha,
                      ),
                      RoundedButton(
                        text: "CADASTRAR",
                        onpressed: _controller.cadastrar,
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
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
