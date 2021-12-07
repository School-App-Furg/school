import 'package:flutter/material.dart';
import 'school_report_controller.dart';

class SchoolReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SchoolReportPage'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 4,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 5, left: 5, top: 3),
                    child: Column(
                      children: [
                        Text('data'),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            child: DataTable(
                              headingTextStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              headingRowColor:
                                  MaterialStateProperty.resolveWith(
                                      (states) => Color(0xFFAAAAAA)),
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
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
