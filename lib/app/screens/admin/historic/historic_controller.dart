import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/models/cycle.dart';
import '../home_page/home_controller.dart';

part 'historic_controller.g.dart';

class HistoricController = _HistoricControllerBase with _$HistoricController;

abstract class _HistoricControllerBase with Store {
  Cycle? cycle;

  //injeção de depencias da user admin
  String schoolId = Modular.get<HomeController>().userAdmin!.schoolId;

  //lista de ciclos da escola
  @observable
  List<Cycle>? listOfCycles = [];

  //ciclo selecionadas
  @observable
  List<String> cycleSelected = [];
}
