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

  final _$studentReceivedAtom =
      Atom(name: '_SchoolReportControllerBase.studentReceived');

  @override
  StudentUser get studentReceived {
    _$studentReceivedAtom.reportRead();
    return super.studentReceived;
  }

  @override
  set studentReceived(StudentUser value) {
    _$studentReceivedAtom.reportWrite(value, super.studentReceived, () {
      super.studentReceived = value;
    });
  }

  final _$initSchoolReportAsyncAction =
      AsyncAction('_SchoolReportControllerBase.initSchoolReport');

  @override
  Future initSchoolReport(Classes classes, StudentUser studentUser) {
    return _$initSchoolReportAsyncAction
        .run(() => super.initSchoolReport(classes, studentUser));
  }

  @override
  String toString() {
    return '''
classReceived: ${classReceived},
studentReceived: ${studentReceived}
    ''';
  }
}
