import 'package:cnpj_cpf_formatter_nullsafety/cnpj_cpf_formatter_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/components/already_have_an_account_button.dart';
import '../../../core/components/rounded_button.dart';
import '../../../core/components/rounded_dropdown.dart';
import '../../../core/components/rounded_input.dart';
import '../../../core/components/rounded_password_field.dart';
import '../../../core/styles/colors.dart';
import '../../../core/styles/sizes.dart';

import '../../../core/service/validators.dart';

import 'register_student_controller.dart';

class RegisterStudentPage extends StatefulWidget {
  @override
  State<RegisterStudentPage> createState() => _RegisterStudentPageState();
}

class _RegisterStudentPageState
    extends ModularState<RegisterStudentPage, RegisterStudentController> {
  @override
  void initState() {
    controller.getSchools();
    super.initState();
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
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/welcome_ok.png",
                      height: widthAll(context),
                    ),
                    Text(
                      "VOCÊ É UM ALUNO? CADASTRE-SE",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RoundedInput(
                        hintText: "Seu nome",
                        controller: controller.nameController,
                        validator: validateEmpty,
                        icon: Icons.person),
                    RoundedInput(
                      hintText: "CPF",
                      mask: [
                        CnpjCpfFormatter(
                          eDocumentType: EDocumentType.CPF,
                        )
                      ],
                      validator: validateCpf,
                      controller: controller.cpfController,
                      icon: Icons.description_outlined,
                    ),
                    Observer(
                      builder: (_) {
                        return RoundedDropdown(
                            value: controller.school,
                            hint: 'Selecione a escola',
                            items: controller.listOfSchools
                                .map<DropdownMenuItem<String>>((e) {
                              return DropdownMenuItem<String>(
                                value: e!.id,
                                child: Text(e.name),
                              );
                            }).toList(),
                            onChanged: controller.setSchool);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(),
                    ),
                    RoundedInput(
                      hintText: "E-mail",
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.emailController,
                      validator: validateEmail,
                      icon: Icons.email,
                    ),
                    Observer(
                      builder: (_) {
                        return RoundedPasswordField(
                            hintSenha: "Senha",
                            controller: controller.senhaController,
                            validator: validateSenha,
                            obscureText: controller.obscureText,
                            onTap: controller.mostrarSenhaUser);
                      },
                    ),
                    RoundedButton(
                      text: "CADASTRAR",
                      onpressed: () => controller.cadastrar(context),
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
