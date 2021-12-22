import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../resources/auth_repository.dart';

import '../../../core/models/school_model.dart';
import '../../../core/styles/sizes.dart';

class HomeDrawer extends StatelessWidget {
  final SchoolModel? schoolModel;
  const HomeDrawer({
    Key? key,
    required this.schoolModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthRepository _authRepository = AuthRepository();

    return Container(
      width: width(context, 0.7),
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromARGB(180, 250, 250, 250),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(31, 38, 135, 0.4),
            blurRadius: 8.0,
          )
        ],
        border: Border(
          right: BorderSide(
            color: Colors.white70,
          ),
        ),
      ),
      child: Stack(
        children: [
          SizedBox(
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 4.0,
                  sigmaY: 4.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.grey.withOpacity(0.0),
                        Colors.white.withOpacity(0.2),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              DrawerHeader(
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(schoolModel!.logo),
                      radius: 30.0,
                    ),
                    SizedBox(
                      width: width(context, 0.05),
                    ),
                    Text(schoolModel!.name)
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.home_outlined,
                        color: Colors.black,
                      ),
                      title: Text("Tela inicial"),
                      onTap: () =>
                          Modular.to.popUntil(ModalRoute.withName('/admin/')),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.person_outline_outlined,
                        color: Colors.black,
                      ),
                      title: Text("Perfil"),
                      onTap: () => Modular.to.pushNamed('./profile',
                          arguments: {'name': schoolModel!.name}),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.class__outlined,
                        color: Colors.black,
                      ),
                      title: Text("Disciplinas"),
                      onTap: () => Modular.to.pushNamed('./register-subjects'),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.switch_account_outlined,
                        color: Colors.black,
                      ),
                      title: Text("Professores"),
                      onTap: () => Modular.to.pushNamed('./register-teacher'),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.switch_account_outlined,
                        color: Colors.black,
                      ),
                      title: Text("Cadastrar\nAuxiliares"),
                      onTap: () => Modular.to.pushNamed('./register-manager'),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.switch_account_outlined,
                        color: Colors.black,
                      ),
                      title: Text("Cadastrar\nAluno"),
                      onTap: () => Modular.to.pushNamed('./register-student'),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.settings_applications_outlined,
                        color: Colors.black,
                      ),
                      title: Text("Ajustes"),
                      onTap: () => Modular.to.pushNamed('./config'),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.logout,
                        color: Colors.black,
                      ),
                      title: Text("Sair"),
                      onTap: () {
                        _authRepository.logout();
                        Modular.to.pop();
                        Modular.to.pushReplacementNamed('/auth/');
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
