import 'package:flutter/material.dart';
import './historic_controller.dart';

class HistoricPage extends StatelessWidget {
  final HistoricController controller = HistoricController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HistoricPage'),
      ),
      body: Container(),
    );
  }
}
