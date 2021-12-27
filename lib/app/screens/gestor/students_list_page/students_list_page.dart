import 'package:flutter/material.dart';

import 'package:school/app/core/models/classes.dart';

import 'components/subjects_listview.dart';

class StudentsListPage extends StatelessWidget {
  final Classes classe;
  const StudentsListPage({
    Key? key,
    required this.classe,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(classe.name),
      ),
      body: StudentsListView(),
    );
  }
}
