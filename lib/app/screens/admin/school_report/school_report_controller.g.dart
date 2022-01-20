// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_report_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SchoolReportController on _SchoolReportControllerBase, Store {
  final _$classReceivedAtom =
      Atom(name: '_SchoolReportControllerBase.classReceived');

  @override
  Classes get classReceived {
    _$classReceivedAtom.reportRead();
    return super.classReceived;
  }

  @override
  set classReceived(Classes value) {
    _$classReceivedAtom.reportWrite(value, super.classReceived, () {
      super.classReceived = value;
    });
  }

  final _$gradesAtom = Atom(name: '_SchoolReportControllerBase.grades');

  @override
  List<Grade> get grades {
    _$gradesAtom.reportRead();
    return super.grades;
  }

  @override
  set grades(List<Grade> value) {
    _$gradesAtom.reportWrite(value, super.grades, () {
      super.grades = value;
    });
  }

  final _$cycleAtom = Atom(name: '_SchoolReportControllerBase.cycle');

  @override
  Cycle? get cycle {
    _$cycleAtom.reportRead();
    return super.cycle;
  }

  @override
  set cycle(Cycle? value) {
    _$cycleAtom.reportWrite(value, super.cycle, () {
      super.cycle = value;
    });
  }

  final _$initSchoolReportAsyncAction =
      AsyncAction('_SchoolReportControllerBase.initSchoolReport');

  @override
  Future initSchoolReport(Classes classes, String studentId) {
    return _$initSchoolReportAsyncAction
        .run(() => super.initSchoolReport(classes, studentId));
  }

  @override
  String toString() {
    return '''
classReceived: ${classReceived},
grades: ${grades},
cycle: ${cycle}
    ''';
  }
}
