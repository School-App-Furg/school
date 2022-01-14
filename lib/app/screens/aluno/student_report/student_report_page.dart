import 'package:flutter/material.dart';
import '../../../core/styles/colors.dart';
import 'components/school_report_list.dart';

class StudentReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disciplina: História'),
      ),
      backgroundColor: lightGrey,
      body: StudentReportList(),
    );
  }
}
