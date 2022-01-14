import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../../../core/form/multi_select.dart';
import 'school_report_generator_controller.dart';

import 'model/boletim_model.dart';

import 'pdf_gerar/gerar_boletim_pdfi.dart';
import 'pdf_gerar/open_pdf.dart';
import 'widget/button_widget.dart';

class SchoolReportGeneratorPage extends StatefulWidget {
  @override
  State<SchoolReportGeneratorPage> createState() =>
      _SchoolReportGeneratorPageState();
}

class _SchoolReportGeneratorPageState extends State<SchoolReportGeneratorPage> {
  final SchoolReportGeneratorController _controller =
      SchoolReportGeneratorController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerar Boletim'),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MultiSelect(
                  buttonText: "Selecione os alunos desta turma",
                  title: "Selecione os alunos:",
                  items: _controller.students
                      .map((e) => MultiSelectItem(e.id, e.name))
                      .toList(),
                  onConfirm: _controller.setStudentsSelected),
              const SizedBox(height: 48),
              ButtonWidget(
                text: 'Gerar PDF',
                onClicked: () async {
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
                      ItensBoletim(
                        disciplinas: 'Ciências',
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
                        disciplinas: 'História',
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
                        disciplinas: 'Geografia',
                        notaBim1: 7.5,
                        notaBim2: 1,
                        notaBim3: 7.5,
                        notaBim4: 10,
                        faltaBim1: 3,
                        faltaBim2: 5,
                        faltaBim3: 3,
                        faltaBim4: 3,
                      ),
                      ItensBoletim(
                        disciplinas: 'Artes',
                        notaBim1: 7.5,
                        notaBim2: 7.5,
                        notaBim3: 10,
                        notaBim4: 7.5,
                        faltaBim1: 3,
                        faltaBim2: 3,
                        faltaBim3: 0,
                        faltaBim4: 3,
                      ),
                      ItensBoletim(
                        disciplinas: 'Educação Física',
                        notaBim1: 8,
                        notaBim2: 7.5,
                        notaBim3: 4,
                        notaBim4: 7.5,
                        faltaBim1: 1,
                        faltaBim2: 1,
                        faltaBim3: 2,
                        faltaBim4: 3,
                      ),
                    ],
                  );

                  final pdfFile = await ReportGenerator.generate(boletim);

                  PdfOpen.openFile(pdfFile);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
