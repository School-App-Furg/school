import 'package:flutter/material.dart';

import 'components/subjects_listview.dart';

class StudentsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alunos'),
      ),
      body: StudentsListView(),
    );
  }
}
