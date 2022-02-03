import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';
import '../../../../core/models/model_table.dart';
import '../../../../core/models/result_model.dart';

import '../../../../core/models/student_user.dart';

import '../../../../core/models/cycle.dart';
import '../../../../core/models/grade.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/sizes.dart';
import '../school_report_controller.dart';

class StudentCard extends StatefulWidget {
  final Cycle cycle;
  final List<Grade> grades;
  final StudentUser studentUser;
  final SchoolReportController controller;
  final String subjectId;
  final String teacherId;

  StudentCard({
    Key? key,
    required this.cycle,
    required this.grades,
    required this.studentUser,
    required this.controller,
    required this.subjectId,
    required this.teacherId,
  }) : super(key: key);

  @override
  State<StudentCard> createState() => _StudentCardState();
}

class _StudentCardState extends State<StudentCard> {
  List<ModelTable> modelList = [];
  ResultModel resultModel = ResultModel(note: '', faults: '');

  @override
  void initState() {
    widget.cycle.evaluationStandard == 'Bimestral'
        ? modelList = widget.controller.setGrades(5, widget.grades)
        : modelList = widget.controller.setGrades(4, widget.grades);
    widget.cycle.evaluationStandard == 'Bimestral'
        ? resultModel = widget.controller.calculate(widget.grades, 5)
        : resultModel = widget.controller.calculate(widget.grades, 4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: defaultWhite,
      child: RoundedExpansionTile(
        title: Text(
          widget.studentUser.name,
          style: TextStyle(fontSize: width(context, .04)),
        ),
        leading: Container(
          height: 40,
          padding: EdgeInsets.only(right: 12.0),
          child: Icon(Icons.person_rounded, color: blueicon),
        ),
        children: [
          DataTable(
            headingTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: white,
                fontSize: width(context, .04)),
            headingRowColor:
                MaterialStateProperty.resolveWith((states) => blueicon),
            columns: [
              DataColumn(label: Text('Avaliação')),
              DataColumn(label: Text('Nota')),
              DataColumn(label: Text('Faltas')),
              if (widget.cycle.initialDate <
                      DateTime.now().millisecondsSinceEpoch &&
                  widget.cycle.finalDate >
                      DateTime.now().millisecondsSinceEpoch)
                DataColumn(
                    label: SizedBox(
                  width: 2,
                ))
            ],
            rows: widget.cycle.evaluationStandard == 'Bimestral'
                ? [
                    laneBimestre(modelList[0]),
                    laneBimestre(modelList[1]),
                    laneBimestre(modelList[2]),
                    laneBimestre(modelList[3]),
                    laneExame(modelList[4]),
                    media(
                        resultModel.note.toString(),
                        resultModel.faults.toString(),
                        widget.controller.getColorGrade(resultModel.note,
                            widget.grades, widget.cycle.approvalPattern),
                        Colors.black),
                    exame(
                        resultModel.note.toString(),
                        resultModel.faults.toString(),
                        widget.controller.getColorGradeExame(resultModel.note,
                            widget.grades, widget.cycle.approvalPattern),
                        Colors.black),
                  ]
                : [
                    laneTrimestre(modelList[0]),
                    laneTrimestre(modelList[1]),
                    laneTrimestre(modelList[2]),
                    laneExame(modelList[3]),
                    media(
                        resultModel.note.toString(),
                        resultModel.faults.toString(),
                        widget.controller.getColorGrade(resultModel.note,
                            widget.grades, widget.cycle.approvalPattern),
                        Colors.black),
                    exame(
                        resultModel.note.toString(),
                        resultModel.faults.toString(),
                        widget.controller.getColorGradeExame(resultModel.note,
                            widget.grades, widget.cycle.approvalPattern),
                        Colors.black),
                  ],
          ),
        ],
      ),
    );
  }

  DataRow laneBimestre(ModelTable modelTable) {
    return DataRow(
      cells: [
        DataCell(Text(modelTable.periodo.toString() + 'º Bimestre')),
        DataCell(Text(modelTable.nota.toString())),
        DataCell(Text(modelTable.faltas.toString())),
        if (widget.cycle.initialDate < DateTime.now().millisecondsSinceEpoch &&
            widget.cycle.finalDate > DateTime.now().millisecondsSinceEpoch)
          DataCell(
            IconButton(
              onPressed: () {
                Modular.to.pushNamed(
                  "./edit-report",
                  arguments: {
                    'cycle': widget.cycle,
                    'modelTable': modelTable,
                    'studentId': widget.studentUser.id,
                    'classId': widget.controller.classReceived.id,
                    'cycleId': widget.controller.classReceived.cycleId,
                    'subjectId': widget.subjectId,
                    'teacherId': widget.teacherId,
                    'gradeId': modelTable.id
                  },
                );
              },
              icon: Icon(
                Icons.edit,
                color: blueicon,
              ),
            ),
          )
      ],
    );
  }

  DataRow laneTrimestre(ModelTable modelTable) {
    return DataRow(
      cells: [
        DataCell(Text(modelTable.periodo.toString() + 'º Trimestre')),
        DataCell(Text(modelTable.nota.toString())),
        DataCell(Text(modelTable.faltas.toString())),
        if (widget.cycle.initialDate < DateTime.now().millisecondsSinceEpoch &&
            widget.cycle.finalDate > DateTime.now().millisecondsSinceEpoch)
          DataCell(
            IconButton(
              onPressed: () {
                Modular.to.pushNamed(
                  "./edit-report",
                  arguments: {
                    'cycle': widget.cycle,
                    'modelTable': modelTable,
                    'studentId': widget.studentUser.id,
                    'classId': widget.controller.classReceived.id,
                    'cycleId': widget.controller.classReceived.cycleId,
                    'subjectId': widget.subjectId,
                    'teacherId': widget.teacherId,
                    'gradeId': modelTable.id
                  },
                );
              },
              icon: Icon(
                Icons.edit,
                color: grey,
              ),
            ),
          ),
      ],
    );
  }

  DataRow laneExame(ModelTable modelTable) {
    return DataRow(
      cells: [
        DataCell(Text('Exame')),
        DataCell(Text(modelTable.nota.toString())),
        DataCell(Text(modelTable.faltas.toString())),
        if (widget.cycle.initialDate < DateTime.now().millisecondsSinceEpoch &&
            widget.cycle.finalDate > DateTime.now().millisecondsSinceEpoch)
          DataCell(
            IconButton(
              onPressed: () {
                Modular.to.pushNamed(
                  "./edit-report",
                  arguments: {
                    'cycle': widget.cycle,
                    'modelTable': modelTable,
                    'studentId': widget.studentUser.id,
                    'classId': widget.controller.classReceived.id,
                    'cycleId': widget.controller.classReceived.cycleId,
                    'subjectId': widget.subjectId,
                    'teacherId': widget.teacherId,
                    'gradeId': modelTable.id
                  },
                );
              },
              icon: Icon(
                Icons.edit,
                color: grey,
              ),
            ),
          ),
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
        if (widget.cycle.initialDate < DateTime.now().millisecondsSinceEpoch &&
            widget.cycle.finalDate > DateTime.now().millisecondsSinceEpoch)
          DataCell(SizedBox()),
      ],
    );
  }

  DataRow exame(
      String nota, String faltas, Color colorGrade, Color colorAttendence) {
    return DataRow(
      cells: [
        DataCell(Text('Exame', style: TextStyle(fontWeight: FontWeight.bold))),
        DataCell(Text(nota,
            style: TextStyle(fontWeight: FontWeight.bold, color: colorGrade))),
        DataCell(Text(faltas,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: colorAttendence))),
        if (widget.cycle.initialDate < DateTime.now().millisecondsSinceEpoch &&
            widget.cycle.finalDate > DateTime.now().millisecondsSinceEpoch)
          DataCell(SizedBox()),
      ],
    );
  }
}
