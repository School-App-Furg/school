import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:school/app/core/components/cycle_period.dart';

import 'historic_controller.dart';

class HistoricPage extends StatefulWidget {
  @override
  State<HistoricPage> createState() => _HistoricPageState();
}

class _HistoricPageState extends State<HistoricPage> {
  final HistoricController controller = HistoricController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico de Ciclos'),
      ),
      body: Observer(builder: (_) {
        return ListView.builder(
          itemCount: 3,
          //controller.listOfCycles!.length,
          itemBuilder: (BuildContext context, int index) {
            //var data = controller.listOfCycles![index];
            return InkWell(
              onTap: () {},
              child: Card(
                child: ListTile(
                  title: Row(
                    children: [
                      CyclePeriod(
                        label: '2021/2',
                        //data.name
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "01/01/21 até 10/04/21",
                        //data.initialDate.toString()
                        //data.finalDate.toString()
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ), //data.name),
                  trailing: Icon(Icons.library_books),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
