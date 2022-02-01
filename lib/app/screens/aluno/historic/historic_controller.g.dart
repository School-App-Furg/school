// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historic_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HistoricController on _HistoricControllerBase, Store {
  final _$listOfCyclesAtom = Atom(name: '_HistoricControllerBase.listOfCycles');

  @override
  List<Cycle?> get listOfCycles {
    _$listOfCyclesAtom.reportRead();
    return super.listOfCycles;
  }

  @override
  set listOfCycles(List<Cycle?> value) {
    _$listOfCyclesAtom.reportWrite(value, super.listOfCycles, () {
      super.listOfCycles = value;
    });
  }

  final _$cycleSelectedAtom =
      Atom(name: '_HistoricControllerBase.cycleSelected');

  @override
  List<String> get cycleSelected {
    _$cycleSelectedAtom.reportRead();
    return super.cycleSelected;
  }

  @override
  set cycleSelected(List<String> value) {
    _$cycleSelectedAtom.reportWrite(value, super.cycleSelected, () {
      super.cycleSelected = value;
    });
  }

  final _$loadingAtom = Atom(name: '_HistoricControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$getCyclesAsyncAction =
      AsyncAction('_HistoricControllerBase.getCycles');

  @override
  Future<dynamic> getCycles(String schoolId, String cycleId) {
    return _$getCyclesAsyncAction.run(() => super.getCycles(schoolId, cycleId));
  }

  final _$_HistoricControllerBaseActionController =
      ActionController(name: '_HistoricControllerBase');

  @override
  dynamic setCycleToHome(String cycleId) {
    final _$actionInfo = _$_HistoricControllerBaseActionController.startAction(
        name: '_HistoricControllerBase.setCycleToHome');
    try {
      return super.setCycleToHome(cycleId);
    } finally {
      _$_HistoricControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listOfCycles: ${listOfCycles},
cycleSelected: ${cycleSelected},
loading: ${loading}
    ''';
  }
}
