import 'package:cnpj_cpf_formatter_nullsafety/cnpj_cpf_formatter_nullsafety.dart';
import 'package:flutter/material.dart';
import '../../../core/models/teacher_user.dart';

import '../../../core/components/label_text.dart';
import '../../../core/components/profiles/background_image.dart';
import '../../../core/components/profiles/perfil_image.dart';
import '../../../core/components/rounded_button.dart';
import '../../../core/components/rounded_input.dart';

import '../../../core/service/validators.dart';
import '../../../core/styles/colors.dart';
import 'profile_controller.dart';

class ProfilePage extends StatefulWidget {
  final TeacherUser teacherUser;

  ProfilePage({
    Key? key,
    required this.teacherUser,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfileController _controller = ProfileController();

  @override
  void initState() {
    _controller.initProfile(widget.teacherUser);
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
                PerfilImage(
                  image: AssetImage("assets/images/teacher-3.jpg"),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelText(
                    text: 'Nome:',
                  ),
                  RoundedInput(
                    controller: _controller.nameController,
                    hintText: "Meu nome",
                    icon: Icons.school,
                    validator: validateEmpty,
                  ),
                  LabelText(
                    text: 'CPF:',
                  ),
                  RoundedInput(
                    controller: _controller.cpfController,
                    hintText: "CPF",
                    mask: [
                      CnpjCpfFormatter(
                        eDocumentType: EDocumentType.CPF,
                      )
                    ],
                    icon: Icons.corporate_fare_rounded,
                    keyboardType: TextInputType.number,
                    validator: validateCnpj,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  RoundedButton(
                    text: "Atualizar",
                    onpressed: () => _controller.update(context),
                    textColor: white,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 2,
              endIndent: 20,
              indent: 20,
            ),
            SizedBox(
              height: 10,
            ),
            RoundedButton(
              text: "Redefinir Senha",
              onpressed: () => _controller.redefinirSenha(context),
              textColor: white,
            ),
          ],
        ),
      ),
    );
  }
}
