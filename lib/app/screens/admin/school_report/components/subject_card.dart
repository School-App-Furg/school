import 'package:flutter/material.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';

import 'package:school/app/core/models/subject_teacher.dart';
import 'package:school/app/core/styles/colors.dart';

class SubjectCard extends StatelessWidget {
  final SubjectTeacher subjectTeacher;
  const SubjectCard({
    Key? key,
    required this.subjectTeacher,
  }) : super(key: key);

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
              'Disciplina: ' + subjectTeacher.subject,
              style: TextStyle(fontSize: 15),
            ),
            Text(
              'Professor(a): ' + subjectTeacher.teacher,
              style: TextStyle(fontSize: 15),
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
            headingTextStyle:
                TextStyle(fontWeight: FontWeight.bold, color: white),
            headingRowColor:
                MaterialStateProperty.resolveWith((states) => primary),
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Avaliação',
                ),
              ),
              DataColumn(
                label: Text(
                  'Nota Final',
                ),
              ),
              DataColumn(
                label: Text(
                  'Faltas',
                ),
              ),
            ],
            rows: <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('1º Trimestre')),
                  DataCell(Text('9.0')),
                  DataCell(Text('1')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('2º Trimestre')),
                  DataCell(Text('8.5')),
                  DataCell(Text('0')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('3º Trimestre')),
                  DataCell(Text('-')),
                  DataCell(Text('-')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Média')),
                  DataCell(Text('-')),
                  DataCell(Text('-')),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
