// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
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

  final _$classesAtom = Atom(name: '_HomeControllerBase.classes');

  @override
  List<Classes>? get classes {
    _$classesAtom.reportRead();
    return super.classes;
  }

  @override
  set classes(List<Classes>? value) {
    _$classesAtom.reportWrite(value, super.classes, () {
      super.classes = value;
    });
  }

  final _$initHomeAsyncAction = AsyncAction('_HomeControllerBase.initHome');

  @override
  Future<dynamic> initHome() {
    return _$initHomeAsyncAction.run(() => super.initHome());
  }

  final _$setSubjectTeacherAsyncAction =
      AsyncAction('_HomeControllerBase.setSubjectTeacher');

  @override
  Future setSubjectTeacher(List<Classes> classes) {
    return _$setSubjectTeacherAsyncAction
        .run(() => super.setSubjectTeacher(classes));
  }

  @override
  String toString() {
    return '''
actualyCycle: ${actualyCycle},
schoolModel: ${schoolModel},
loading: ${loading},
classes: ${classes}
    ''';
  }
}
