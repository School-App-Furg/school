import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../aluno_service.dart';
import '../home_page/home_controller.dart';

import '../../../core/models/cycle.dart';

part 'historic_controller.g.dart';

class HistoricController = _HistoricControllerBase with _$HistoricController;

abstract class _HistoricControllerBase with Store {
  AlunoService _alunoService = AlunoService();

  //acompanhamento do carregamento da requisição
  @observable
  bool loading = false;

//lista de ciclos da escola
  @observable
  List<Cycle?> listOfCycles = [];

  //solicita as lista de ciclos
  @action
  Future getCycles(String schoolId, Cycle cycle) async {
    loading = true;
    listOfCycles = await _alunoService.getCycles(schoolId, cycle.id!);
    loading = false;
  }

  //altera o ciclo existente na home screen
  @action
  setCycleToHome(Cycle cycle) {
    Modular.get<HomeController>().actualyCycle = cycle;
    _alunoService.updateHome();
    Modular.to.pop();
  }

  //formatação do tipo data
  DateFormat format = DateFormat("dd/MM/yyyy");
  String convertDate(int date) {
    return format.format(DateTime.fromMillisecondsSinceEpoch(date));
  }
}
