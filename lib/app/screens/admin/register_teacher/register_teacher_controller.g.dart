// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_teacher_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterTeacherController on _RegisterTeacherControllerBase, Store {
  final _$classesAtom = Atom(name: '_RegisterTeacherControllerBase.classes');

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

  final _$classesStringAtom =
      Atom(name: '_RegisterTeacherControllerBase.classesString');

  @override
  List<String> get classesString {
    _$classesStringAtom.reportRead();
    return super.classesString;
  }

  @override
  set classesString(List<String> value) {
    _$classesStringAtom.reportWrite(value, super.classesString, () {
      super.classesString = value;
    });
  }

  final _$getClassesAsyncAction =
      AsyncAction('_RegisterTeacherControllerBase.getClasses');

  @override
  Future<dynamic> getClasses() {
    return _$getClassesAsyncAction.run(() => super.getClasses());
  }

  final _$_RegisterTeacherControllerBaseActionController =
      ActionController(name: '_RegisterTeacherControllerBase');

  @override
  dynamic defineClasses(String? value) {
    final _$actionInfo = _$_RegisterTeacherControllerBaseActionController
        .startAction(name: '_RegisterTeacherControllerBase.defineClasses');
    try {
      return super.defineClasses(value);
    } finally {
      _$_RegisterTeacherControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
classes: ${classes},
classesString: ${classesString}
    ''';
  }
}
