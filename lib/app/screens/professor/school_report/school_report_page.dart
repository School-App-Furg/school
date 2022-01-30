import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/components/loader/loader_page.dart';

import '../../../core/models/subject_teacher.dart';

import '../../../core/models/classes.dart';
import '../school_report_generator/model/boletim_model.dart';
import '../school_report_generator/pdf_gerar/gerar_boletim_pdfi.dart';
import '../school_report_generator/pdf_gerar/open_pdf.dart';
import 'components/student_card.dart';
import 'school_report_controller.dart';

class SchoolReportPage extends StatefulWidget {
  final Classes classe;
  final SubjectTeacher subjectTeacher;
  const SchoolReportPage({
    Key? key,
    required this.classe,
    required this.subjectTeacher,
  }) : super(key: key);
  @override
  State<SchoolReportPage> createState() => _SchoolReportPageState();
}

class _SchoolReportPageState
    extends ModularState<SchoolReportPage, SchoolReportController> {
  @override
  void initState() {
    super.initState();
    controller.initSchoolReport(widget.classe, widget.subjectTeacher);
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
