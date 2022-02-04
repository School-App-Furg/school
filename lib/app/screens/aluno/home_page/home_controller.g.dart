// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$subjectsAtom = Atom(name: '_HomeControllerBase.subjects');

  @override
  List<SubjectTeacher> get subjects {
    _$subjectsAtom.reportRead();
    return super.subjects;
  }

  @override
  set subjects(List<SubjectTeacher> value) {
    _$subjectsAtom.reportWrite(value, super.subjects, () {
      super.subjects = value;
    });
  }

  final _$actualyCycleAtom = Atom(name: '_HomeControllerBase.actualyCycle');

  @override
  Cycle? get actualyCycle {
    _$actualyCycleAtom.reportRead();
    return super.actualyCycle;
  }

  @override
  set actualyCycle(Cycle? value) {
    _$actualyCycleAtom.reportWrite(value, super.actualyCycle, () {
      super.actualyCycle = value;
    });
  }

  final _$schoolModelAtom = Atom(name: '_HomeControllerBase.schoolModel');

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

  final _$userStudentAtom = Atom(name: '_HomeControllerBase.userStudent');

  @override
  StudentUser? get userStudent {
    _$userStudentAtom.reportRead();
    return super.userStudent;
  }

  @override
  set userStudent(StudentUser? value) {
    _$userStudentAtom.reportWrite(value, super.userStudent, () {
      super.userStudent = value;
    });
  }

  final _$loadingAtom = Atom(name: '_HomeControllerBase.loading');

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

  final _$initHomeAsyncAction = AsyncAction('_HomeControllerBase.initHome');

  @override
  Future<dynamic> initHome() {
    return _$initHomeAsyncAction.run(() => super.initHome());
  }

  @override
  String toString() {
    return '''
subjects: ${subjects},
actualyCycle: ${actualyCycle},
schoolModel: ${schoolModel},
userStudent: ${userStudent},
loading: ${loading}
    ''';
  }
}
