// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_report_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SchoolReportController on _SchoolReportControllerBase, Store {
  final _$subjectsAtom = Atom(name: '_SchoolReportControllerBase.subjects');

  @override
  List<Subject>? get subjects {
    _$subjectsAtom.reportRead();
    return super.subjects;
  }

  @override
  set subjects(List<Subject>? value) {
    _$subjectsAtom.reportWrite(value, super.subjects, () {
      super.subjects = value;
    });
  }

  final _$getSubjectsAsyncAction =
      AsyncAction('_SchoolReportControllerBase.getSubjects');

  @override
  Future getSubjects() {
    return _$getSubjectsAsyncAction.run(() => super.getSubjects());
  }

  @override
  String toString() {
    return '''
subjects: ${subjects}
    ''';
  }
}