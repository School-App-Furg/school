import 'package:cnpj_cpf_formatter_nullsafety/cnpj_cpf_formatter_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/components/already_have_an_account_button.dart';
import '../../../core/components/rounded_button.dart';
import '../../../core/components/rounded_input.dart';
import '../../../core/components/rounded_password_field.dart';
import '../../../core/service/validators.dart';
import '../../../core/styles/colors.dart';
import '../../../core/styles/sizes.dart';
import 'register_school_controller.dart';

class RegisterSchool extends StatefulWidget {
  const RegisterSchool({Key? key}) : super(key: key);

  @override
  State<RegisterSchool> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterSchool> {
  final RegisterController _controller = RegisterController();

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
                key: _controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/welcome_ok.png",
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
                        controller: _controller.nomeEscolaController,
                        validator: validateEmpty,
                        icon: Icons.school),
                    RoundedInput(
                      hintText: "CNPJ",
                      mask: [
                        CnpjCpfFormatter(
                          eDocumentType: EDocumentType.CNPJ,
                        )
                      ],
                      validator: validateCnpj,
                      controller: _controller.cnpjController,
                      icon: Icons.description_outlined,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(),
                    ),
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
                            onTap: _controller.mostrarSenhaUser);
                      },
                    ),
                    RoundedButton(
                      text: "CADASTRAR",
                      onpressed: () => _controller.cadastrar(context),
                      textColor: blue,
                    ),
                    SizedBox(
                      height: height(context, 0.05),
                      child: AlreadyHaveAnAccountCheck(
                        login: false,
                        press: () => Modular.to.navigate("./login"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 30,
              left: 10,
              child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Modular.to.pop()),
            ),
          ],
        ),
      ),
    );
  }
}
