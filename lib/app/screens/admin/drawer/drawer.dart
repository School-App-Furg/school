import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/models/cycle.dart';
import '../../../core/models/school_model.dart';
import '../../../core/styles/colors.dart';
import '../../../core/styles/sizes.dart';
import '../../../resources/auth_repository.dart';
import '../admin_service.dart';

class HomeDrawer extends StatelessWidget {
  final SchoolModel? schoolModel;
  final Cycle cycle;
  final AuthRepository? authRepository;
  const HomeDrawer({
    Key? key,
    required this.schoolModel,
    required this.cycle,
    this.authRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthRepository _authRepository = AuthRepository();
    AdminService _adminService = AdminService();
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
                        defaultWhite.withOpacity(0.2),
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
                      backgroundImage: AssetImage('assets/images/school.png'),
                      radius: 30.0,
                    ),
                    SizedBox(
                      width: width(context, 0.05),
                    ),
                    Flexible(
                      child: Text(
                        schoolModel!.name,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.home_outlined,
                      color: Colors.black,
                    ),
                    title: Text("Tela inicial"),
                    onTap: () => _adminService.updateHome(),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.person_outline_outlined,
                      color: Colors.black,
                    ),
                    title: Text("Perfil"),
                    onTap: () => Modular.to.pushNamed('./profile', arguments: {
                      'schoolModel': schoolModel,
                      'authRepository': authRepository
                    }),
                  ),
                  if (cycle.id == schoolModel!.currentCycle)
                    ListTile(
                      leading: Icon(
                        Icons.class__outlined,
                        color: Colors.black,
                      ),
                      title: Text("Disciplinas"),
                      onTap: () => Modular.to.pushNamed('./subjects-list'),
                    ),
                  if (cycle.id == schoolModel!.currentCycle)
                    ListTile(
                      leading: Icon(
                        Icons.switch_account_outlined,
                        color: Colors.black,
                      ),
                      title: Text("Professores"),
                      onTap: () => Modular.to.pushNamed('./teachers-list'),
                    ),
                  if (cycle.id == schoolModel!.currentCycle)
                    ListTile(
                      leading: Icon(
                        Icons.switch_account_outlined,
                        color: Colors.black,
                      ),
                      title: Text("Alunos"),
                      onTap: () => Modular.to.pushNamed('./students-list'),
                    ),
                  if (cycle.id == schoolModel!.currentCycle)
                    ListTile(
                      leading: Icon(
                        Icons.settings_applications_outlined,
                        color: Colors.black,
                      ),
                      title: Text("Configurações"),
                      onTap: () => Modular.to.pushNamed('./config',
                          arguments: {'schoolId': schoolModel!.id}),
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
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
