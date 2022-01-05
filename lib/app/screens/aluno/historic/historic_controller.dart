import 'package:mobx/mobx.dart';

part 'historic_controller.g.dart';

class HistoricPageController = _HistoricPageControllerBase
    with _$HistoricPageController;

abstract class _HistoricPageControllerBase with Store {}
