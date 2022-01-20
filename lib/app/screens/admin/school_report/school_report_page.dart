import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:school/app/core/models/classes.dart';
import 'package:school/app/core/models/student_user.dart';
import 'package:school/app/screens/admin/school_report/school_report_controller.dart';

import '../../../core/styles/colors.dart';
import 'components/subject_card.dart';

class SchoolReportPage extends StatefulWidget {
  final Classes classe;
  final StudentUser studentUser;
  const SchoolReportPage({
    Key? key,
    required this.classe,
    required this.studentUser,
  }) : super(key: key);
  @override
  State<SchoolReportPage> createState() => _SchoolReportPageState();
}

class _SchoolReportPageState
    extends ModularState<SchoolReportPage, SchoolReportController> {
  @override
  void initState() {
    super.initState();
    controller.initSchoolReport(widget.classe, widget.studentUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: Text(
          'Boletim',
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.receipt_sharp),
            onPressed: () => Modular.to.pushNamed('./generate-report'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: controller.classReceived.subjectTeachers!.length,
        itemBuilder: (_, index) {
          var data = controller.classReceived.subjectTeachers![index];
          return SubjectCard(
            subjectTeacher: data,
          );
        },
      ),
    );
  }
}
