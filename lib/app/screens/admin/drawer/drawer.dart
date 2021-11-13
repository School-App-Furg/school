import 'dart:ui';

import 'package:flutter/material.dart';
import '../../../core/styles/sizes.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _userAvatar = "https://randomuser.me/api/portraits/men/46.jpg";
    return Container(
      width: width(context, 0.8),
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
                      gradient: LinearGradient(colors: [
                    Colors.grey.withOpacity(0.0),
                    Colors.white.withOpacity(0.2),
                  ])),
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
                      onTap: () {},
                      leading: Icon(
                        Icons.home,
                        color: Colors.black,
                      ),
                      title: Text("Tela inicial"),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      title: Text("Perfil"),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.app_registration_rounded,
                        color: Colors.black,
                      ),
                      title: Text("Cadastro\nProfessor/Aluno"),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.settings,
                        color: Colors.black,
                      ),
                      title: Text("Ajustes"),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.logout,
                        color: Colors.black,
                      ),
                      title: Text("Sair"),
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
