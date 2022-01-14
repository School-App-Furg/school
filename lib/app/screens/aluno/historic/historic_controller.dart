import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:school/app/core/models/cycle.dart';
import 'package:school/app/screens/admin/admin_service.dart';
import 'package:school/app/screens/aluno/home_page/home_controller.dart';

part 'historic_controller.g.dart';

class HistoricPageController = _HistoricPageControllerBase
    with _$HistoricPageController;

abstract class _HistoricPageControllerBase with Store {
  AdminService _adminService = AdminService();
  Cycle? cycle;

  //injeção de depencias da user student
  String schoolId = Modular.get<HomeController>().userStudent!.schoolId;

  //lista de ciclos da escola
  @observable
  List<Cycle>? listOfCycles = [];

  //ciclo selecionadas
  @observable
  List<String> cycleSelected = [];
}
