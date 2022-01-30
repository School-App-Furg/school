import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'school_report_generator/model/boletim_model.dart';
import 'school_report_generator/pdf_gerar/gerar_boletim_pdfi.dart';
import 'school_report_generator/pdf_gerar/open_pdf.dart';

import '../../../core/components/loader/loader_page.dart';

import '../../../core/models/classes.dart';

import 'school_report_controller.dart';

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
