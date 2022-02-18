// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_report_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SchoolReportController on _SchoolReportControllerBase, Store {
  final _$loadingAtom = Atom(name: '_SchoolReportControllerBase.loading');

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

  final _$classesAtom = Atom(name: '_SchoolReportControllerBase.classes');

  @override
  Classes get classes {
    _$classesAtom.reportRead();
    return super.classes;
  }

  @override
  set classes(Classes value) {
    _$classesAtom.reportWrite(value, super.classes, () {
      super.classes = value;
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
  Future initSchoolReport(
      Classes classesReceived, String studentId, Cycle cycleReceived) {
    return _$initSchoolReportAsyncAction.run(() =>
        super.initSchoolReport(classesReceived, studentId, cycleReceived));
  }

  final _$_SchoolReportControllerBaseActionController =
      ActionController(name: '_SchoolReportControllerBase');

  @override
  List<Grade> filterGrades(String subject, String teacher) {
    final _$actionInfo = _$_SchoolReportControllerBaseActionController
        .startAction(name: '_SchoolReportControllerBase.filterGrades');
    try {
      return super.filterGrades(subject, teacher);
    } finally {
      _$_SchoolReportControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<ModelTable> setGrades(int numberOfLines, List<Grade> grade) {
    final _$actionInfo = _$_SchoolReportControllerBaseActionController
        .startAction(name: '_SchoolReportControllerBase.setGrades');
    try {
      return super.setGrades(numberOfLines, grade);
    } finally {
      _$_SchoolReportControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  ResultModel calculate(List<Grade> grade, int numberOfLines) {
    final _$actionInfo = _$_SchoolReportControllerBaseActionController
        .startAction(name: '_SchoolReportControllerBase.calculate');
    try {
      return super.calculate(grade, numberOfLines);
    } finally {
      _$_SchoolReportControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
classes: ${classes},
grades: ${grades},
cycle: ${cycle}
    ''';
  }
}
