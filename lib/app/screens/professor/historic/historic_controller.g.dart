// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historic_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HistoricController on _HistoricControllerBase, Store {
  final _$listOfCyclesAtom = Atom(name: '_HistoricControllerBase.listOfCycles');

  @override
  List<Cycle>? get listOfCycles {
    _$listOfCyclesAtom.reportRead();
    return super.listOfCycles;
  }

  @override
  set listOfCycles(List<Cycle>? value) {
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

  @override
  String toString() {
    return '''
listOfCycles: ${listOfCycles},
cycleSelected: ${cycleSelected}
    ''';
  }
}
