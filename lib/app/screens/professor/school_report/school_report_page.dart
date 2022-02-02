import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/models/cycle.dart';

import '../../../core/components/loader/loader_page.dart';
import '../../../core/models/classes.dart';
import '../../../core/models/subject_teacher.dart';
import 'components/student_card.dart';
import 'school_report_controller.dart';

class SchoolReportPage extends StatefulWidget {
  final Classes classe;
  final SubjectTeacher subjectTeacher;
  final Cycle cycle;
  const SchoolReportPage({
    Key? key,
    required this.classe,
    required this.subjectTeacher,
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
    controller.initSchoolReport(
        widget.classe, widget.subjectTeacher, widget.cycle);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return controller.loading
            ? LoaderPage()
            : Scaffold(
                appBar: AppBar(
                  title: Text(
                      '${widget.subjectTeacher.subject} - ${widget.classe.level}º ano, ${widget.classe.name}'),
                ),
                body: ListView.builder(
                  itemCount: controller.students.length,
                  itemBuilder: (_, index) {
                    return StudentCard(
                      teacherId: widget.subjectTeacher.idTeacher,
                      subjectId: widget.subjectTeacher.idSubject,
                      studentUser: controller.students[index],
                      grades: controller
                          .filterGrades(controller.students[index].id!),
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
