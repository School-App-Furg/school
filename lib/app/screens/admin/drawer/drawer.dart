import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:school/app/screens/repository/auth_repository.dart';
import '../../../core/styles/sizes.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthRepository _authRepository = AuthRepository();
    String _userAvatar = "https://randomuser.me/api/portraits/men/46.jpg";
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
                      backgroundImage: NetworkImage(_userAvatar),
                      radius: 30.0,
                    ),
                    SizedBox(
                      width: width(context, 0.05),
                    ),
                    Text("Administração\nEscolar")
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.home,
                        color: Colors.black,
                      ),
                      title: Text("Tela inicial"),
                      onTap: () => Modular.to
                          .pushNamedAndRemoveUntil('/admin/', (_) => false),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      title: Text("Perfil"),
                      onTap: () => Modular.to.pushNamed('./profile'),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.app_registration_rounded,
                        color: Colors.black,
                      ),
                      title: Text("Cadastro\nProfessor/Aluno"),
                      onTap: () => Modular.to.pushNamed('./register'),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.settings,
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
