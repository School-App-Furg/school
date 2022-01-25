import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:school/app/screens/aluno/student_report/student_report_generator/model/boletim_model.dart';
import 'package:school/app/screens/aluno/student_report/student_report_generator/pdf_gerar/gerar_boletim_pdfi.dart';
import 'package:school/app/screens/aluno/student_report/student_report_generator/pdf_gerar/open_pdf.dart';

import '../../../core/models/subject_teacher.dart';

import '../../../core/components/loader/loader_page.dart';
import '../../../core/styles/colors.dart';
import 'components/subject_card.dart';
import 'student_report_controller.dart';

class StudentReportPage extends StatefulWidget {
  final String studentId;
  final SubjectTeacher subjectTeacher;

  const StudentReportPage({
    Key? key,
    required this.studentId,
    required this.subjectTeacher,
  }) : super(key: key);
  @override
  State<StudentReportPage> createState() => _StudentReportPageState();
}

class _StudentReportPageState
    extends ModularState<StudentReportPage, StudentReportController> {
  @override
  void initState() {
    super.initState();
    controller.initStudentReport(widget.studentId, widget.subjectTeacher);
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
                    widget.subjectTeacher.subject,
                  ),
                  actions: [
                    IconButton(
                        icon: Icon(Icons.receipt_sharp),
                        onPressed: () async {
                          final boletim = Boletim(
                            items: [
                              ItensBoletim(
                                disciplinas: 'Português',
                                notaBim1: 7.5,
                                notaBim2: 7.5,
                                notaBim3: 7.5,
                                notaBim4: 7.5,
                                faltaBim1: 3,
                                faltaBim2: 3,
                                faltaBim3: 3,
                                faltaBim4: 3,
                              ),
                              ItensBoletim(
                                disciplinas: 'Matemática',
                                notaBim1: 7.5,
                                notaBim2: 7.5,
                                notaBim3: 7.5,
                                notaBim4: 7.5,
                                faltaBim1: 3,
                                faltaBim2: 3,
                                faltaBim3: 3,
                                faltaBim4: 3,
                              ),
                            ],
                          );

                          final pdfFile =
                              await ReportGenerator.generate(boletim);

                          PdfOpen.openFile(pdfFile);
                        }),
                  ],
                ),
                body: SubjectCard(
                  subjectTeacher: widget.subjectTeacher,
                  grade: controller.grades,
                  cycle: controller.cycle!,
                  controller: controller,
                ),
              );
      },
    );
  }
}
