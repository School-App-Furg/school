// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_school_report_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditSchoolReportController on _EditSchoolReportControllerBase, Store {
  final _$cycleReceivedAtom =
      Atom(name: '_EditSchoolReportControllerBase.cycleReceived');

  @override
  Cycle? get cycleReceived {
    _$cycleReceivedAtom.reportRead();
    return super.cycleReceived;
  }

  @override
  set cycleReceived(Cycle? value) {
    _$cycleReceivedAtom.reportWrite(value, super.cycleReceived, () {
      super.cycleReceived = value;
    });
  }

  final _$periodAtom = Atom(name: '_EditSchoolReportControllerBase.period');

  @override
  String get period {
    _$periodAtom.reportRead();
    return super.period;
  }

  @override
  set period(String value) {
    _$periodAtom.reportWrite(value, super.period, () {
      super.period = value;
    });
  }

  final _$insertAsyncAction =
      AsyncAction('_EditSchoolReportControllerBase.insert');

  @override
  Future insert(BuildContext context, String studentUser, String cycleId,
      String subjectId, String teacherId, String classId) {
    return _$insertAsyncAction.run(() => super
        .insert(context, studentUser, cycleId, subjectId, teacherId, classId));
  }

  final _$updateAsyncAction =
      AsyncAction('_EditSchoolReportControllerBase.update');

  @override
  Future update(BuildContext context, String gradeId) {
    return _$updateAsyncAction.run(() => super.update(context, gradeId));
  }

  final _$_EditSchoolReportControllerBaseActionController =
      ActionController(name: '_EditSchoolReportControllerBase');

  @override
  dynamic initEditSchoolReport(Cycle cycle, ModelTable modelTable) {
    final _$actionInfo =
        _$_EditSchoolReportControllerBaseActionController.startAction(
            name: '_EditSchoolReportControllerBase.initEditSchoolReport');
    try {
      return super.initEditSchoolReport(cycle, modelTable);
    } finally {
      _$_EditSchoolReportControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cycleReceived: ${cycleReceived},
period: ${period}
    ''';
  }
}
