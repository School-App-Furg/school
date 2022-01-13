import 'package:flutter/material.dart';
import 'package:school/app/core/components/profiles/background_image.dart';
import 'package:school/app/core/components/profiles/perfil_image.dart';
import 'package:school/app/core/components/profiles/top_text.dart';
import 'package:school/app/core/components/rounded_button.dart';
import 'package:school/app/core/components/rounded_input.dart';
import 'package:school/app/core/models/student_user.dart';
import 'package:school/app/core/service/validators.dart';
import 'package:school/app/core/styles/colors.dart';
import 'package:school/app/screens/aluno/perfil/perfil_controller.dart';

class PerfilPage extends StatefulWidget {
  final StudentUser studentModel;

  const PerfilPage({Key? key, required this.studentModel}) : super(key: key);
  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final PerfilController _controller = PerfilController();

  @override
  void initState() {
    _controller.initProfile(widget.studentModel);
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
                  image: AssetImage("assets/images/teacher.png"),
                ),
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
                    controller: _controller.cpfController,
                    hintText: "CPF",
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
    );
  }
}
