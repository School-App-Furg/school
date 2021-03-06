import 'package:cnpj_cpf_formatter_nullsafety/cnpj_cpf_formatter_nullsafety.dart';
import 'package:flutter/material.dart';

import '../../../core/components/label_text.dart';
import '../../../core/components/profiles/background_image.dart';
import '../../../core/components/profiles/perfil_image.dart';
import '../../../core/components/rounded_button.dart';
import '../../../core/models/student_user.dart';
import '../../../core/service/validators.dart';
import '../../../core/styles/colors.dart';
import 'components/rounded_input.dart';
import 'perfil_controller.dart';

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
              children: const [
                BackgroundImage(),
                PerfilImage(
                  image: AssetImage("assets/images/student.jpg"),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelText(
                    text: 'Nome do aluno:',
                  ),
                  RoundedInputAluno(
                    controller: _controller.nameController,
                    hintText: "Nome do aluno",
                    icon: Icons.school,
                    validator: validateEmpty,
                  ),
                  LabelText(
                    text: 'CPF do aluno:',
                  ),
                  RoundedInputAluno(
                    mask: [
                      CnpjCpfFormatter(
                        eDocumentType: EDocumentType.CPF,
                      )
                    ],
                    controller: _controller.cpfController,
                    hintText: "CPF",
                    icon: Icons.description_rounded,
                    keyboardType: TextInputType.number,
                    validator: validateCpf,
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
              onpressed: () => _controller.recuperarSenha(context),
              textColor: white,
            ),
          ],
        ),
      ),
    );
  }
}
