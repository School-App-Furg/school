import 'package:cnpj_cpf_formatter_nullsafety/cnpj_cpf_formatter_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:school/app/core/components/rounded_password_field.dart';

import 'package:school/app/core/service/navigation.dart';
import 'package:school/app/screens/auth/register/register_controller.dart';
import '../../../core/components/already_have_an_account_button.dart';
import '../../../core/components/rounded_button.dart';
import '../../../core/components/rounded_input.dart';
import '../../../core/styles/colors.dart';
import '../../../core/styles/sizes.dart';
import '../../repository/auth_repository.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final RegisterController _controller = RegisterController();

  @override
  void initState() {
    super.initState();
    _controller.setupValidations();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                    Observer(
                      builder: (_) => RoundedInput(
                          hintText: "Nome da Escola",
                          onChanged: (value) => _controller.nomeEscola = value,
                          errorText: _controller.error.nomeEscola,
                          icon: Icons.school),
                    ),
                    Observer(
                      builder: (_) => RoundedInput(
                        hintText: "CNPJ",
                        mask: [
                          CnpjCpfFormatter(
                            eDocumentType: EDocumentType.CNPJ,
                          )
                        ],
                        onChanged: (value) => _controller.cnpj = value,
                        errorText: _controller.error.cnpj,
                        icon: Icons.description_outlined,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(),
                    ),
                    Observer(
                      builder: (_) => RoundedInput(
                        hintText: "E-mail",
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) => _controller.email = value,
                        errorText: _controller.error.email,
                        icon: Icons.email,
                      ),
                    ),
                    Observer(
                      builder: (_) => RoundedPasswordField(
                        hintSenha: "Senha",
                        onChanged: (value) => _controller.senha = value,
                        errorText: _controller.error.senha,
                      ),
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
                        press: () => navigateToLoginPage(context),
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
