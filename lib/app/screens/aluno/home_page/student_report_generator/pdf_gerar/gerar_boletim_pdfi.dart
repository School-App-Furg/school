import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import '../model/boletim_model.dart';
import 'open_pdf.dart';

class ReportGenerator {
  static Future<File> generate(Boletim boletim) async {
    final pdf = Document();

    pdf.addPage(MultiPage(
      build: (context) => [
        buildTitle(boletim),
        buildDescription(boletim),
        buildTable(boletim),
      ],
      theme: ThemeData.withFont(
        base: Font.ttf(await rootBundle.load("assets/arial.ttf")),
        bold: Font.ttf(await rootBundle.load("assets/arial.ttf")),
        italic: Font.ttf(await rootBundle.load("assets/arial.ttf")),
        boldItalic: Font.ttf(await rootBundle.load("assets/arial.ttf")),
      ),
    ));

    return PdfOpen.saveDocument(name: 'boletim.pdf', pdf: pdf);
  }

  static Widget buildTitle(Boletim boletim) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'BOLETIM ESCOLAR',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
        ],
      );

  static Widget buildTable(Boletim boletim) {
    final headers = [
      'Disciplinas',
      'Nota 1ºBim',
      'Nota 2ºBim',
      'Nota 3ºBim',
      'Nota 4ºBim',
      'Falta 1ºBim',
      'Falta 2ºBim',
      'Falta 3ºBim',
      'Falta 4ºBim',
      'Total Faltas',
      'Nota Final'
    ];
    final data = boletim.items.map((item) {
      final totalFaltas =
          item.faltaBim1 + item.faltaBim2 + item.faltaBim3 + item.faltaBim4;
      final mediaNotas =
          (item.notaBim1 + item.notaBim2 + item.notaBim3 + item.notaBim4) / 4;

      return [
        item.disciplina,
        '${item.notaBim1}',
        '${item.notaBim2}',
        '${item.notaBim3}',
        '${item.notaBim4}',
        '${item.faltaBim1.toStringAsFixed(2)}',
        '${item.faltaBim2.toStringAsFixed(2)}',
        '${item.faltaBim3.toStringAsFixed(2)}',
        '${item.faltaBim4.toStringAsFixed(2)}',
        '$totalFaltas',
        '${mediaNotas.toStringAsFixed(2)}',
      ];
    }).toList();

    return Table.fromTextArray(
      headers: headers,
      data: data,
      //border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(color: PdfColors.grey300),
      cellHeight: 40,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerRight,
        2: Alignment.centerRight,
        3: Alignment.centerRight,
        4: Alignment.centerRight,
        5: Alignment.centerRight,
      },
    );
  }

  static Widget buildDescription(Boletim boletim) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(
                  title: 'Escola:',
                  value: boletim.schoolName,
                ),
                buildText(
                  title: 'Nome Aluno:',
                  value: boletim.studentName,
                ),
                buildText(
                  title: 'Ciclo:',
                  value: boletim.cycleName,
                ),
                SizedBox(height: 2 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
                SizedBox(height: 0.5 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
              ],
            ),
          ),
          Spacer(flex: 6),
        ],
      ),
    );
  }

  static buildText({
    required String title,
    required String value,
    double width = double.infinity,
    TextStyle? titleStyle,
  }) {
    final style = titleStyle ?? TextStyle(fontWeight: FontWeight.bold);

    return Container(
      width: width,
      child: Row(
        children: [
          Expanded(child: Text(title, style: style)),
          Text(value),
        ],
      ),
    );
  }
}
