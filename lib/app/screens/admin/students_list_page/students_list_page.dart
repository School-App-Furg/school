import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/components/app_bar_report.dart';
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
      appBar: AppBarReport(
        textButton: "Gerar Relatório Disciplina",
        onPressed: () {},
        text: 'Alunos',
        onPressedHistoric: () => Modular.to.pushNamed('./historic'),
        onPressedSubject: () => Modular.to.pushNamed('./register-class'),
      ),
      body: StudentsListView(),
    );
  }
}
