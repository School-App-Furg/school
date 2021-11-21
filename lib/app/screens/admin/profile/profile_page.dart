import 'package:flutter/material.dart';
import 'package:school/app/screens/admin/profile/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  final ProfileController controller = ProfileController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProfilePage'),
      ),
      body: Container(),
    );
  }
}
