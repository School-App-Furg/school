import 'package:flutter/material.dart';
import 'package:school/app/screens/home/home_controller.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController controller = HomeController();
  @override
  void initState() {
    super.initState();
    controller.buscarAlunos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: controller.notas.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                Text(controller.notas[index].name),
                Text(controller.notas[index].nota.toString())
              ],
            );
          },
        ),
      ),
    );
  }
}
