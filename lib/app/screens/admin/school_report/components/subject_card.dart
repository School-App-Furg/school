import 'package:flutter/material.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';

import '../../../../core/models/cycle.dart';
import '../../../../core/models/grade.dart';
import '../../../../core/models/model_table.dart';
import '../../../../core/models/result_model.dart';
import '../../../../core/models/subject_teacher.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/sizes.dart';
import '../school_report_controller.dart';

class SubjectCard extends StatefulWidget {
  final Cycle cycle;
  final List<Grade> grade;
  final SubjectTeacher subjectTeacher;
  final SchoolReportController controller;
  const SubjectCard({
    Key? key,
    required this.cycle,
    required this.grade,
    required this.subjectTeacher,
    required this.controller,
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
        ? modelList = widget.controller.setGrades(5, widget.grade)
        : modelList = widget.controller.setGrades(4, widget.grade);
    widget.cycle.evaluationStandard == 'Bimestral'
        ? resultModel = widget.controller.calculate(widget.grade, 4)
        : resultModel = widget.controller.calculate(widget.grade, 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: defaultWhite,
      child: RoundedExpansionTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.subjectTeacher.subject,
              style: TextStyle(fontSize: width(context, .045)),
            ),
            Text(
              'Professor(a): ' + widget.subjectTeacher.teacher,
              style: TextStyle(fontSize: width(context, .032)),
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
                MaterialStateProperty.resolveWith((states) => blueicon),
            columns: const [
              DataColumn(label: Text('Avalia????o')),
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
                        resultModel.note,
                        resultModel.faults,
                        widget.controller.getColorGrade(
                            resultModel.note,
                            widget.grade,
                            widget.cycle.approvalPattern,
                            widget.cycle.evaluationStandard,
                            false)),
                    laneExame(
                      modelList[4],
                      widget.controller.getColorGrade(
                          modelList[4].nota,
                          widget.grade,
                          widget.cycle.approvalPattern,
                          widget.cycle.evaluationStandard,
                          true),
                    ),
                  ]
                : [
                    laneTrimestre(modelList[0].periodo, modelList[0].nota,
                        modelList[0].faltas),
                    laneTrimestre(modelList[1].periodo, modelList[1].nota,
                        modelList[1].faltas),
                    laneTrimestre(modelList[2].periodo, modelList[2].nota,
                        modelList[2].faltas),
                    media(
                      resultModel.note,
                      resultModel.faults,
                      widget.controller.getColorGrade(
                          resultModel.note,
                          widget.grade,
                          widget.cycle.approvalPattern,
                          widget.cycle.evaluationStandard,
                          false),
                    ),
                    laneExame(
                      modelList[3],
                      widget.controller.getColorGrade(
                          modelList[3].nota,
                          widget.grade,
                          widget.cycle.approvalPattern,
                          widget.cycle.evaluationStandard,
                          true),
                    ),
                  ],
          ),
        ],
      ),
    );
  }

  DataRow laneBimestre(String periodo, String nota, String faltas) {
    return DataRow(
      cells: [
        DataCell(Text(periodo.toString() + '?? Bimestre')),
        DataCell(Text(nota.toString())),
        DataCell(Text(faltas.toString())),
      ],
    );
  }

  DataRow laneTrimestre(String periodo, String nota, String faltas) {
    return DataRow(
      cells: [
        DataCell(Text(periodo.toString() + '?? Trimestre')),
        DataCell(Text(nota.toString())),
        DataCell(Text(faltas.toString())),
      ],
    );
  }

  DataRow media(String nota, String faltas, Color colorGrade) {
    return DataRow(
      cells: [
        DataCell(Text('M??dia', style: TextStyle(fontWeight: FontWeight.bold))),
        DataCell(Text(nota,
            style: TextStyle(fontWeight: FontWeight.bold, color: colorGrade))),
        DataCell(Text(faltas, style: TextStyle(fontWeight: FontWeight.bold))),
      ],
    );
  }

  DataRow laneExame(ModelTable modelTable, Color color) {
    return DataRow(
      cells: [
        DataCell(Text('Exame')),
        DataCell(Text(
          modelTable.nota.toString(),
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        )),
        DataCell(Text(modelTable.faltas.toString())),
      ],
    );
  }
}
