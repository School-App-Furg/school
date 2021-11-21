import 'package:flutter/material.dart';
import './config_controller.dart';

class ConfigPage extends StatelessWidget {
  final ConfigController controller = ConfigController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ConfigPage'),
      ),
      body: Container(),
    );
  }
}
