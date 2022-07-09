import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/models/school_model.dart';
import '../../../core/models/teacher_user.dart';
import '../../../core/styles/colors.dart';
import '../../../core/styles/sizes.dart';
import '../../../resources/auth_repository.dart';
import '../professor_service.dart';

class HomeDrawer extends StatelessWidget {
  final AuthRepository? authRepository;
  final SchoolModel? schoolModel;
  final TeacherUser? teacherUser;
  const HomeDrawer({
    Key? key,
    required this.schoolModel,
    required this.teacherUser,
    this.authRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthRepository _authRepository = AuthRepository();
    final ProfessorService _professorService = ProfessorService();
    return Container(
      width: width(context, 0.7),
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromARGB(180, 250, 250, 250),
        boxShadow: const [
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
                      backgroundImage:
                          AssetImage('assets/images/teacher-3.jpg'),
                      radius: 30.0,
                      backgroundColor: white,
                    ),
                    SizedBox(
                      width: width(context, 0.05),
                    ),
                    Flexible(
                      child: Text(
                        teacherUser!.name,
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
                    onTap: () {
                      _professorService.updateHome();
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.person_outline_outlined,
                      color: Colors.black,
                    ),
                    title: Text("Perfil"),
                    onTap: () =>
                        Modular.to.pushNamed('./profile-page', arguments: {
                      'teacherUser': teacherUser,
                    }),
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
                      Modular.to.pushReplacementNamed('/auth/login');
                    },
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
