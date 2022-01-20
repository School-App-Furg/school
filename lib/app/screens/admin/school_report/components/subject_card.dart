import 'package:flutter/material.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';

import 'package:school/app/core/models/cycle.dart';
import 'package:school/app/core/models/grade.dart';
import 'package:school/app/core/models/subject_teacher.dart';
import 'package:school/app/core/styles/colors.dart';
import 'package:school/app/core/styles/sizes.dart';

class SubjectCard extends StatefulWidget {
  final Cycle cycle;
  final List<Grade> grade;
  final SubjectTeacher subjectTeacher;
  SubjectCard({
    Key? key,
    required this.cycle,
    required this.grade,
    required this.subjectTeacher,
  }) : super(key: key);

  @override
  State<SubjectCard> createState() => _SubjectCardState();
}

class _SubjectCardState extends State<SubjectCard> {
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
                    DataRow(
                      cells: [
                        DataCell(Text('1º Bimestre')),
                        DataCell(Text('9.0')),
                        DataCell(Text('1')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('2º Bimestre')),
                        DataCell(Text('8.5')),
                        DataCell(Text('0')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('3º Bimestre')),
                        DataCell(Text('-')),
                        DataCell(Text('-')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('4º Bimestre')),
                        DataCell(Text('-')),
                        DataCell(Text('-')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text(
                            'Média',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataCell(Text('-',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                        DataCell(Text('-',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ]
                : [
                    DataRow(
                      cells: [
                        DataCell(Text('1º Trimestre')),
                        DataCell(Text('9.0')),
                        DataCell(Text('1')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('2º Trimestre')),
                        DataCell(Text('8.5')),
                        DataCell(Text('0')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('3º Trimestre')),
                        DataCell(Text('-')),
                        DataCell(Text('-')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text(
                            'Média',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataCell(Text('-',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                        DataCell(Text('-',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ],
          ),
        ],
      ),
    );
  }
}
