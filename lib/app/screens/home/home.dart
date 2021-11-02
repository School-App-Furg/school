import 'package:flutter/material.dart';
import 'package:school/app/screens/home/home_controller.dart';

import 'components/class_card.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController controller = HomeController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
          color: Colors.black,
        ),
        title: const Text(
          'School App',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
            color: Colors.black,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: const [
            ClassCard(
              imagem:
                  'https://www.gstatic.com/classroom/themes/img_breakfast.jpg',
              disciplina: 'Biologia',
              professor: 'Alice',
            ),
            ClassCard(
              imagem:
                  'https://www.gstatic.com/classroom/themes/img_bookclub.jpg',
              disciplina: 'Inglês',
              professor: 'Peter Parker',
            ),
            ClassCard(
              imagem: 'https://www.gstatic.com/classroom/themes/Honors.jpg',
              disciplina: 'História',
              professor: 'Felipe',
            ),
            ClassCard(
              imagem:
                  'https://www.gstatic.com/classroom/themes/img_learnlanguage.jpg',
              disciplina: 'Matemática',
              professor: 'Karina',
            ),
            ClassCard(
              imagem: 'https://www.gstatic.com/classroom/themes/img_code.jpg',
              disciplina: 'Geografia',
              professor: 'Leonel',
            ),
            ClassCard(
              imagem: 'https://www.gstatic.com/classroom/themes/Chemistry.jpg',
              disciplina: 'Química',
              professor: 'Thor',
            ),
          ],
        ),
      ),
    );
  }
}
