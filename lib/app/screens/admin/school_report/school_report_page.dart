import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/models/cycle.dart';

import '../../../core/components/loader/loader_page.dart';
import '../../../core/models/classes.dart';
import '../../../core/styles/colors.dart';
import 'components/subject_card.dart';
import 'school_report_controller.dart';

class SchoolReportPage extends StatefulWidget {
  final Classes classe;
  final String studentId;
  final Cycle cycle;

  const SchoolReportPage({
    Key? key,
    required this.classe,
    required this.studentId,
    required this.cycle,
  }) : super(key: key);
  @override
  State<SchoolReportPage> createState() => _SchoolReportPageState();
}

class _SchoolReportPageState
    extends ModularState<SchoolReportPage, SchoolReportController> {
  @override
  void initState() {
    super.initState();
    controller.initSchoolReport(widget.classe, widget.studentId, widget.cycle);
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
                      controller: controller,
                    );
                  },
                ),
              );
      },
    );
  }
}
