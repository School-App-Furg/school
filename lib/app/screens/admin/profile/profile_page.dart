import 'package:flutter/material.dart';
import 'package:school/app/core/components/rounded_button.dart';
import 'package:school/app/core/components/rounded_input.dart';
import 'package:school/app/core/service/validators.dart';
import 'package:school/app/core/styles/colors.dart';

import 'components/background_image.dart';
import 'components/perfil_image.dart';
import 'components/top_text.dart';
import 'profile_controller.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final ProfileController controller = ProfileController();

  ProfilePage({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                BackgroundImage(),
                ClipPath(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.only(top: 40, left: 20),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                PerfilImage(),
              ],
            ),
            RightTextProfile(
              name: 'Escolinha LTDA',
              currentCycle: 'Ciclo atual: 2022/1',
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  RoundedInput(
                    controller: controller.cnpjController,
                    hintText: "CNPJ",
                    icon: Icons.corporate_fare_rounded,
                    keyboardType: TextInputType.number,
                    validator: validateCnpj,
                  ),
                  RoundedInput(
                    controller: controller.emailController,
                    hintText: "E-mail",
                    icon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                    validator: validateEmail,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  RoundedButton(
                    text: "Redefinir Senha",
                    onpressed: () {},
                    textColor: white,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 4,
              endIndent: 100,
              indent: 100,
            ),
          ],
        ),
      ),
      /*Container(
        child: Text(name),
      ),*/
    );
  }
}
