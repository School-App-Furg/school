// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_cycle_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewCycleController on _NewCycleControllerBase, Store {
  final _$cycleNameAtom = Atom(name: '_NewCycleControllerBase.cycleName');

  @override
  TextEditingController get cycleName {
    _$cycleNameAtom.reportRead();
    return super.cycleName;
  }

  @override
  set cycleName(TextEditingController value) {
    _$cycleNameAtom.reportWrite(value, super.cycleName, () {
      super.cycleName = value;
    });
  }

  final _$loadingPageAtom = Atom(name: '_NewCycleControllerBase.loadingPage');

  @override
  bool get loadingPage {
    _$loadingPageAtom.reportRead();
    return super.loadingPage;
  }

  @override
  set loadingPage(bool value) {
    _$loadingPageAtom.reportWrite(value, super.loadingPage, () {
      super.loadingPage = value;
    });
  }

  final _$cyclePeriodAtom = Atom(name: '_NewCycleControllerBase.cyclePeriod');

  @override
  String get cyclePeriod {
    _$cyclePeriodAtom.reportRead();
    return super.cyclePeriod;
  }

  @override
  set cyclePeriod(String value) {
    _$cyclePeriodAtom.reportWrite(value, super.cyclePeriod, () {
      super.cyclePeriod = value;
    });
  }

  final _$initialDateAtom = Atom(name: '_NewCycleControllerBase.initialDate');

  @override
  DateTime get initialDate {
    _$initialDateAtom.reportRead();
    return super.initialDate;
  }

  @override
  set initialDate(DateTime value) {
    _$initialDateAtom.reportWrite(value, super.initialDate, () {
      super.initialDate = value;
    });
  }

  final _$finalDateAtom = Atom(name: '_NewCycleControllerBase.finalDate');

  @override
  DateTime get finalDate {
    _$finalDateAtom.reportRead();
    return super.finalDate;
  }

  @override
  set finalDate(DateTime value) {
    _$finalDateAtom.reportWrite(value, super.finalDate, () {
      super.finalDate = value;
    });
  }

  final _$scoreAtom = Atom(name: '_NewCycleControllerBase.score');

  @override
  String get score {
    _$scoreAtom.reportRead();
    return super.score;
  }

  @override
  set score(String value) {
    _$scoreAtom.reportWrite(value, super.score, () {
      super.score = value;
    });
  }

  final _$attendanceAtom = Atom(name: '_NewCycleControllerBase.attendance');

  @override
  String get attendance {
    _$attendanceAtom.reportRead();
    return super.attendance;
  }

  @override
  set attendance(String value) {
    _$attendanceAtom.reportWrite(value, super.attendance, () {
      super.attendance = value;
    });
  }

  final _$schoolModelAtom = Atom(name: '_NewCycleControllerBase.schoolModel');

  @override
  SchoolModel? get schoolModel {
    _$schoolModelAtom.reportRead();
    return super.schoolModel;
  }

  @override
  set schoolModel(SchoolModel? value) {
    _$schoolModelAtom.reportWrite(value, super.schoolModel, () {
      super.schoolModel = value;
    });
  }

  final _$_NewCycleControllerBaseActionController =
      ActionController(name: '_NewCycleControllerBase');

  @override
  dynamic setCyclePeriod(dynamic e) {
    final _$actionInfo = _$_NewCycleControllerBaseActionController.startAction(
        name: '_NewCycleControllerBase.setCyclePeriod');
    try {
      return super.setCyclePeriod(e);
    } finally {
      _$_NewCycleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setinitialDate(dynamic e) {
    final _$actionInfo = _$_NewCycleControllerBaseActionController.startAction(
        name: '_NewCycleControllerBase.setinitialDate');
    try {
      return super.setinitialDate(e);
    } finally {
      _$_NewCycleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFinalDate(dynamic e) {
    final _$actionInfo = _$_NewCycleControllerBaseActionController.startAction(
        name: '_NewCycleControllerBase.setFinalDate');
    try {
      return super.setFinalDate(e);
    } finally {
      _$_NewCycleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setScore(dynamic e) {
    final _$actionInfo = _$_NewCycleControllerBaseActionController.startAction(
        name: '_NewCycleControllerBase.setScore');
    try {
      return super.setScore(e);
    } finally {
      _$_NewCycleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAttendance(dynamic e) {
    final _$actionInfo = _$_NewCycleControllerBaseActionController.startAction(
        name: '_NewCycleControllerBase.setAttendance');
    try {
      return super.setAttendance(e);
    } finally {
      _$_NewCycleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cycleName: ${cycleName},
loadingPage: ${loadingPage},
cyclePeriod: ${cyclePeriod},
initialDate: ${initialDate},
finalDate: ${finalDate},
score: ${score},
attendance: ${attendance},
schoolModel: ${schoolModel}
    ''';
  }
}
