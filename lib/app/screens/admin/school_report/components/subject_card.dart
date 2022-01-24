import 'package:flutter/material.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';

import 'package:school/app/core/models/cycle.dart';
import 'package:school/app/core/models/grade.dart';
import 'package:school/app/core/models/subject_teacher.dart';
import 'package:school/app/core/styles/colors.dart';
import 'package:school/app/core/styles/sizes.dart';
import 'package:school/app/screens/admin/school_report/components/result_model.dart';
import 'package:school/app/screens/admin/school_report/school_report_controller.dart';

import 'model_table.dart';

class SubjectCard extends StatefulWidget {
  final Cycle cycle;
  final List<Grade> grade;
  final SubjectTeacher subjectTeacher;
  final SchoolReportController schoolReportController;
  SubjectCard({
    Key? key,
    required this.cycle,
    required this.grade,
    required this.subjectTeacher,
    required this.schoolReportController,
  }) : super(key: key);

  @override
  State<SubjectCard> createState() => _SubjectCardState();
}

class _SubjectCardState extends State<SubjectCard> {
  List<ModelTable> modelList = [];
  ResultModel resultModel = ResultModel(note: '', faults: '');
  @override
  void initState() {
    widget.cycle.evaluationStandard == 'Bimestral'
        ? modelList = widget.schoolReportController.setGrades(4, widget.grade)
        : modelList = widget.schoolReportController.setGrades(3, widget.grade);
    widget.cycle.evaluationStandard == 'Bimestral'
        ? resultModel = widget.schoolReportController.calculate(widget.grade, 4)
        : resultModel =
            widget.schoolReportController.calculate(widget.grade, 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: RoundedExpansionTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.subjectTeacher.subject,
              style: TextStyle(fontSize: width(context, .04)),
            ),
            Text(
              'Professor(a): ' + widget.subjectTeacher.teacher,
              style: TextStyle(fontSize: width(context, .025)),
            ),
          ],
        ),
        leading: Container(
          height: 40,
          padding: EdgeInsets.only(right: 12.0),
          child: Icon(Icons.book, color: blueicon),
        ),
        children: [
          DataTable(
            headingRowHeight: 50,
            headingTextStyle:
                TextStyle(fontWeight: FontWeight.bold, color: white),
            headingRowColor:
                MaterialStateProperty.resolveWith((states) => primary),
            columns: [
              DataColumn(label: Text('Avaliação')),
              DataColumn(label: Text('Nota Final')),
              DataColumn(label: Text('Faltas')),
            ],
            rows: widget.cycle.evaluationStandard == 'Bimestral'
                ? [
                    laneBimestre(modelList[0].periodo, modelList[0].nota,
                        modelList[0].faltas),
                    laneBimestre(modelList[1].periodo, modelList[1].nota,
                        modelList[1].faltas),
                    laneBimestre(modelList[2].periodo, modelList[2].nota,
                        modelList[2].faltas),
                    laneBimestre(modelList[3].periodo, modelList[3].nota,
                        modelList[3].faltas),
                    media(
                        resultModel.note.toString(),
                        resultModel.faults.toString(),
                        getColorGrade(double.parse(resultModel.note)),
                        getColorAttendence(double.parse(resultModel.faults)))
                  ]
                : [
                    laneTrimestre(modelList[0].periodo, modelList[0].nota,
                        modelList[0].faltas),
                    laneTrimestre(modelList[1].periodo, modelList[1].nota,
                        modelList[1].faltas),
                    laneTrimestre(modelList[2].periodo, modelList[2].nota,
                        modelList[2].faltas),
                    media(
                        resultModel.note.toString(),
                        resultModel.faults.toString(),
                        getColorGrade(double.parse(resultModel.note)),
                        getColorAttendence(double.parse(resultModel.faults)))
                  ],
          ),
        ],
      ),
    );
  }

  DataRow laneBimestre(String periodo, String nota, String faltas) {
    return DataRow(
      cells: [
        DataCell(Text(periodo.toString() + 'º Bimestre')),
        DataCell(Text(nota.toString())),
        DataCell(Text(faltas.toString())),
      ],
    );
  }

  DataRow laneTrimestre(String periodo, String nota, String faltas) {
    return DataRow(
      cells: [
        DataCell(Text(periodo.toString() + 'º Trimestre')),
        DataCell(Text(nota.toString())),
        DataCell(Text(faltas.toString())),
      ],
    );
  }

  DataRow media(
      String nota, String faltas, Color colorGrade, Color colorAttendence) {
    return DataRow(
      cells: [
        DataCell(Text('Média', style: TextStyle(fontWeight: FontWeight.bold))),
        DataCell(Text(nota,
            style: TextStyle(fontWeight: FontWeight.bold, color: colorGrade))),
        DataCell(Text(faltas,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: colorAttendence))),
      ],
    );
  }

  Color getColorGrade(nota) {
    //chamo a média definida, tiro o caractere '%' e converto string pra double
    var notaMinima = double.parse(
        (widget.cycle.approvalPattern.replaceAll(RegExp('%'), '')));
    assert(notaMinima is double);
    //em seguida faço os cálculos com base no valor da nota média
    //e retorno a cor resultante
    if ((nota < (notaMinima / 10))) return red;
    if (nota >= (notaMinima / 10)) return green;
    //Em caso de erro
    return Colors.blue;
  }

  Color getColorAttendence(faltas) {
    //chamo a média definida, tiro o caractere '%' e converto string pra double
    var faltasMaximas = double.parse(
        (widget.cycle.approvalAttendance.replaceAll(RegExp('%'), '')));
    assert(faltasMaximas is double);
    //Precisa ser ajustado aqui. Quem sabe o professor já seta um valor X de
    //faltas máximas
    if ((faltas < (faltasMaximas))) return green;
    if (faltas >= (faltasMaximas)) return red;
    //Em caso de erro
    return Colors.blue;
  }
}
