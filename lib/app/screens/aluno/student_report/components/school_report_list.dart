import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';

import '../../../../core/styles/colors.dart';

class StudentReportList extends StatelessWidget {
  const StudentReportList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Card(
          elevation: 0,
          color: Colors.white,
          child: ExpansionTile(
            initiallyExpanded: true,
            title: Text('Aluno'),
            leading: Container(
              height: 40,
              padding: EdgeInsets.only(right: 12.0),
              child: Icon(Icons.person_rounded, color: blueicon),
            ),
            childrenPadding: EdgeInsets.zero,
            children: [
              DataTable(
                horizontalMargin: 40,
                headingTextStyle:
                    TextStyle(fontWeight: FontWeight.bold, color: white),
                headingRowColor:
                    MaterialStateProperty.resolveWith((states) => blueicon),
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
                rows: const <DataRow>[
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
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
