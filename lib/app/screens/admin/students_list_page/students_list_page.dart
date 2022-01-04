import 'package:flutter/material.dart';

import '../../../core/models/classes.dart';
import 'components/subjects_listview.dart';

class StudentsListForClass extends StatelessWidget {
  final Classes classe;
  const StudentsListForClass({
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
