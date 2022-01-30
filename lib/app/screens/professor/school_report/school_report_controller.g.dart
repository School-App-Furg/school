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

  final _$studentsAtom = Atom(name: '_SchoolReportControllerBase.students');

  @override
  List<StudentUser> get students {
    _$studentsAtom.reportRead();
    return super.students;
  }

  @override
  set students(List<StudentUser> value) {
    _$studentsAtom.reportWrite(value, super.students, () {
      super.students = value;
    });
  }

  final _$initSchoolReportAsyncAction =
      AsyncAction('_SchoolReportControllerBase.initSchoolReport');

  @override
  Future initSchoolReport(Classes classe, SubjectTeacher subjectTeacher) {
    return _$initSchoolReportAsyncAction
        .run(() => super.initSchoolReport(classe, subjectTeacher));
  }

  final _$getGradesAsyncAction =
      AsyncAction('_SchoolReportControllerBase.getGrades');

  @override
  Future getGrades() {
    return _$getGradesAsyncAction.run(() => super.getGrades());
  }

  final _$_SchoolReportControllerBaseActionController =
      ActionController(name: '_SchoolReportControllerBase');

  @override
  List<Grade> filterGrades(String idStudent) {
    final _$actionInfo = _$_SchoolReportControllerBaseActionController
        .startAction(name: '_SchoolReportControllerBase.filterGrades');
    try {
      return super.filterGrades(idStudent);
    } finally {
      _$_SchoolReportControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
classReceived: ${classReceived},
grades: ${grades},
cycle: ${cycle},
students: ${students}
    ''';
  }
}
