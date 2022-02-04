// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_report_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StudentReportController on _StudentReportControllerBase, Store {
  final _$loadingAtom = Atom(name: '_StudentReportControllerBase.loading');

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

  final _$gradesAtom = Atom(name: '_StudentReportControllerBase.grades');

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

  final _$initStudentReportAsyncAction =
      AsyncAction('_StudentReportControllerBase.initStudentReport');

  @override
  Future initStudentReport(
      String studentId, SubjectTeacher subjectTeacher, Cycle cycle) {
    return _$initStudentReportAsyncAction
        .run(() => super.initStudentReport(studentId, subjectTeacher, cycle));
  }

  final _$_StudentReportControllerBaseActionController =
      ActionController(name: '_StudentReportControllerBase');

  @override
  ResultModel calculate(List<Grade> grade, int numberOfLines) {
    final _$actionInfo = _$_StudentReportControllerBaseActionController
        .startAction(name: '_StudentReportControllerBase.calculate');
    try {
      return super.calculate(grade, numberOfLines);
    } finally {
      _$_StudentReportControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
grades: ${grades}
    ''';
  }
}
