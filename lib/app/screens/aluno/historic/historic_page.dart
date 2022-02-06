import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/components/loader/loader_page.dart';
import '../../../core/models/cycle.dart';
import 'components/historic_card.dart';
import 'historic_controller.dart';

class HistoricPage extends StatefulWidget {
  final String schoolId;
  final Cycle cycle;
  const HistoricPage({
    Key? key,
    required this.schoolId,
    required this.cycle,
  }) : super(key: key);
  @override
  State<HistoricPage> createState() => _HistoricPageState();
}

class _HistoricPageState
    extends ModularState<HistoricPage, HistoricController> {
  @override
  void initState() {
    controller.getCycles(widget.schoolId, widget.cycle);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return controller.loading
            ? LoaderPage()
            : Scaffold(
                appBar: AppBar(
                  title: Text('Histórico de Ciclos'),
                ),
                body: Observer(
                  builder: (_) {
                    return controller.listOfCycles.length == 0
                        ? Center(
                            child: Text('Nenhum ciclo anterior existente!'),
                          )
                        : ListView.builder(
                            itemCount: controller.listOfCycles.length,
                            itemBuilder: (BuildContext context, int index) {
                              Cycle data = controller.listOfCycles[index]!;
                              return HistoricCard(
                                cycle: data,
                                controller: controller,
                                onTap: () => controller.setCycleToHome(data),
                              );
                            },
                          );
                  },
                ),
              );
      },
    );
  }
}
