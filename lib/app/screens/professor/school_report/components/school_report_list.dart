import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';
import '../../../../core/styles/colors.dart';

class SchoolReportList extends StatelessWidget {
  const SchoolReportList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Expanded(
          flex: 5,
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (_, index) {
              return Card(
                elevation: 0,
                color: Colors.white,
                child: RoundedExpansionTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  title: Text('Disciplina #$index'),
                  children: [
                    DataTable(
                      headingTextStyle:
                          TextStyle(fontWeight: FontWeight.bold, color: white),
                      headingRowColor: MaterialStateProperty.resolveWith(
                          (states) => blueicon),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            Modular.to.pushNamed("./edit-report");
                          },
                          icon: Icon(Icons.edit),
                          label: Text(
                            "Editar",
                            style: TextStyle(color: white),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
