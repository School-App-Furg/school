import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../../../core/models/cycle.dart';
import '../home_page/home_controller.dart';
import '../professor_service.dart';

part 'historic_controller.g.dart';

class HistoricController = _HistoricControllerBase with _$HistoricController;

abstract class _HistoricControllerBase with Store {
  ProfessorService _professorService = ProfessorService();
  Cycle? cycle;

  //lista de ciclos da escola
  @observable
  List<Cycle?> listOfCycles = [];

  //ciclo selecionadas
  @observable
  List<String> cycleSelected = [];

  @observable
  bool loading = false;

  //Solicita as lista de ciclos
  @action
  Future getCycles(String schoolId, Cycle cycle) async {
    loading = true;
    listOfCycles = await _professorService.getCycles(schoolId, cycle.id!);
    loading = false;
  }

  @action
  setCycleToHome(Cycle cycle) {
    Modular.get<HomeController>().actualyCycle = cycle;
    _professorService.updateHome();
    Modular.to.pop();
  }

  DateFormat format = DateFormat("dd/MM/yyyy");

  String convertDate(int date) {
    return format.format(DateTime.fromMillisecondsSinceEpoch(date));
  }
}
