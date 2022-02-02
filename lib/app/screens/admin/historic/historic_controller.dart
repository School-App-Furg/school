import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:school/app/screens/admin/admin_service.dart';

import '../home_page/home_controller.dart';

import '../../../core/models/cycle.dart';

part 'historic_controller.g.dart';

class HistoricController = _HistoricControllerBase with _$HistoricController;

abstract class _HistoricControllerBase with Store {
  AdminService _adminService = AdminService();
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
    listOfCycles = await _adminService.getCycles(schoolId, cycle.id!);
    loading = false;
  }

  @action
  setCycleToHome(Cycle cycle) {
    Modular.get<HomeController>().actualyCycle = cycle;
    _adminService.updateHome();
    Modular.to.pop();
  }

  DateFormat format = DateFormat("dd/MM/yyyy");

  String convertDate(int date) {
    return format.format(DateTime.fromMillisecondsSinceEpoch(date));
  }
}
