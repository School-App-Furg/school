import 'package:flutter/material.dart';
import 'components/classwork_tab/classwork_tab.dart';
import 'components/people_tab/people_tab.dart';

import 'classroom_controller.dart';
import 'components/stream_tab/stream_tab.dart';

class ClassRoomPage extends StatefulWidget {
  final ClassroomController controller = ClassroomController();
  final NetworkImage bannerImg;
  final String disciplina;
  final Color uiColor;

  ClassRoomPage(
      {required this.disciplina,
      required this.bannerImg,
      required this.uiColor});

  @override
  _ClassRoomPageState createState() => _ClassRoomPageState();
}

class _ClassRoomPageState extends State<ClassRoomPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      StreamTab(
        controller: widget.controller,
        bannerImg: widget.bannerImg,
        disciplina: widget.disciplina,
      ),
      ClassWork(controller: widget.controller),
      PeopleTab(
        controller: widget.controller,
      )
    ];
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
      body: tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Presenças'),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Avaliações',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Pessoas'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.redAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
