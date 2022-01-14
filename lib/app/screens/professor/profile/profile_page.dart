import 'package:flutter/material.dart';
import '../../../core/components/profiles/background_image.dart';
import '../../../core/components/profiles/perfil_image.dart';
import '../../../core/components/profiles/top_text.dart';
import '../../../core/components/rounded_button.dart';
import '../../../core/components/rounded_input.dart';
import '../../../core/models/teacher_user.dart';
import '../../../core/service/validators.dart';
import '../../../core/styles/colors.dart';
import 'profile_controller.dart';

class ProfilePage extends StatefulWidget {
  final TeacherUser teacherModel;
  ProfilePage({
    Key? key,
    required this.teacherModel,
  }) : super(key: key);
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfileController _controller = ProfileController();
  @override
  void initState() {
    _controller.initProfile(widget.teacherModel);
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
