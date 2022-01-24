import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:school/app/core/components/loader/loader_page.dart';

import 'package:school/app/core/models/classes.dart';

import 'package:school/app/screens/admin/school_report/school_report_controller.dart';

import '../../../core/styles/colors.dart';
import 'components/subject_card.dart';

class SchoolReportPage extends StatefulWidget {
  final Classes classe;
  final String studentId;

  const SchoolReportPage({
    Key? key,
    required this.classe,
    required this.studentId,
  }) : super(key: key);
  @override
  State<SchoolReportPage> createState() => _SchoolReportPageState();
}

class _SchoolReportPageState
    extends ModularState<SchoolReportPage, SchoolReportController> {
  @override
  void initState() {
    super.initState();
    controller.initSchoolReport(widget.classe, widget.studentId);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return controller.loading
            ? LoaderPage()
            : Scaffold(
                backgroundColor: lightGrey,
                appBar: AppBar(
                  title: Text(
                    'Boletim',
                  ),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.receipt_sharp),
                      onPressed: () =>
                          Modular.to.pushNamed('./generate-report'),
                    ),
                  ],
                ),
                body: ListView.builder(
                  itemCount: controller.classReceived.subjectTeachers!.length,
                  itemBuilder: (_, index) {
                    var data = controller.classReceived.subjectTeachers![index];
                    return SubjectCard(
                      subjectTeacher: data,
                      grade: controller.filterGrades(
                          data.idSubject, data.idTeacher),
                      cycle: controller.cycle!,
                      schoolReportController: controller,
                    );
                  },
                ),
              );
      },
    );
  }
}
