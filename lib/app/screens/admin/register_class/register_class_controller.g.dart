// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_class_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterClassController on _RegisterClassControllerBase, Store {
  final _$classesAtom = Atom(name: '_RegisterClassControllerBase.classes');

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

  final _$classesSelectedAtom =
      Atom(name: '_RegisterClassControllerBase.classesSelected');

  @override
  List<dynamic> get classesSelected {
    _$classesSelectedAtom.reportRead();
    return super.classesSelected;
  }

  @override
  set classesSelected(List<dynamic> value) {
    _$classesSelectedAtom.reportWrite(value, super.classesSelected, () {
      super.classesSelected = value;
    });
  }

  final _$subjectsAtom = Atom(name: '_RegisterClassControllerBase.subjects');

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

  final _$subjectsSelectedAtom =
      Atom(name: '_RegisterClassControllerBase.subjectsSelected');

  @override
  List<dynamic> get subjectsSelected {
    _$subjectsSelectedAtom.reportRead();
    return super.subjectsSelected;
  }

  @override
  set subjectsSelected(List<dynamic> value) {
    _$subjectsSelectedAtom.reportWrite(value, super.subjectsSelected, () {
      super.subjectsSelected = value;
    });
  }

  final _$getClassesAsyncAction =
      AsyncAction('_RegisterClassControllerBase.getClasses');

  @override
  Future<dynamic> getClasses() {
    return _$getClassesAsyncAction.run(() => super.getClasses());
  }

  final _$getSubjectsAsyncAction =
      AsyncAction('_RegisterClassControllerBase.getSubjects');

  @override
  Future<dynamic> getSubjects() {
    return _$getSubjectsAsyncAction.run(() => super.getSubjects());
  }

  @override
  String toString() {
    return '''
classes: ${classes},
classesSelected: ${classesSelected},
subjects: ${subjects},
subjectsSelected: ${subjectsSelected}
    ''';
  }
}
