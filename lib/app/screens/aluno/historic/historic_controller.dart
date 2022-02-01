import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import 'package:school/app/screens/aluno/aluno_service.dart';
import 'package:school/app/screens/aluno/home_page/home_controller.dart';

import '../../../core/models/cycle.dart';

part 'historic_controller.g.dart';

class HistoricController = _HistoricControllerBase with _$HistoricController;

abstract class _HistoricControllerBase with Store {
  AlunoService _alunoService = AlunoService();
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
  Future getCycles(String schoolId, String cycleId) async {
    loading = true;
    listOfCycles = await _alunoService.getCycles(schoolId, cycleId);
    loading = false;
  }

  DateFormat format = DateFormat("dd/MM/yyyy");

  String convertDate(int date) {
    return format.format(DateTime.fromMillisecondsSinceEpoch(date));
  }

  @action
  setCycleToHome(String cycleId) {
    Modular.get<HomeController>().actualyCycle = cycleId;
    _alunoService.updateHome();
    Modular.to.pop();
  }
}
