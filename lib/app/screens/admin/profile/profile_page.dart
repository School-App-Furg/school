import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:school/app/core/components/rounded_button.dart';
import 'package:school/app/core/components/rounded_input.dart';
import 'package:school/app/core/models/school_model.dart';
import 'package:school/app/core/service/validators.dart';
import 'package:school/app/core/styles/colors.dart';
import 'package:school/app/resources/auth_repository.dart';

import 'components/background_image.dart';
import 'components/perfil_image.dart';
import 'components/top_text.dart';
import 'profile_controller.dart';

class ProfilePage extends StatefulWidget {
  final SchoolModel schoolModel;

  ProfilePage({
    Key? key,
    required this.schoolModel,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfileController _controller = ProfileController();

  @override
  void initState() {
    _controller.initProfile(widget.schoolModel);

    super.initState();
  }

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
                PerfilImage(),
              ],
            ),
            RightTextProfile(
              name: _controller.nameController.text,
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  RoundedInput(
                    controller: _controller.cnpjController,
                    hintText: "CNPJ",
                    icon: Icons.corporate_fare_rounded,
                    keyboardType: TextInputType.number,
                    validator: validateCnpj,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  RoundedButton(
                    text: "Redefinir Senha",
                    onpressed: () => _controller.recuperarSenha(context),
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
