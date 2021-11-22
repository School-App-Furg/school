import 'package:flutter/material.dart';

import 'profile_controller.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final ProfileController controller = ProfileController();

  ProfilePage({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProfilePage'),
      ),
      body: Container(
        child: Text(name),
      ),
    );
  }
}
