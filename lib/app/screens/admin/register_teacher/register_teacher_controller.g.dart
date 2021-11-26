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

  final _$classesSelecionadasAtom =
      Atom(name: '_RegisterTeacherControllerBase.classesSelecionadas');

  @override
  List<dynamic> get classesSelecionadas {
    _$classesSelecionadasAtom.reportRead();
    return super.classesSelecionadas;
  }

  @override
  set classesSelecionadas(List<dynamic> value) {
    _$classesSelecionadasAtom.reportWrite(value, super.classesSelecionadas, () {
      super.classesSelecionadas = value;
    });
  }

  final _$getClassesAsyncAction =
      AsyncAction('_RegisterTeacherControllerBase.getClasses');

  @override
  Future<dynamic> getClasses() {
    return _$getClassesAsyncAction.run(() => super.getClasses());
  }

  @override
  String toString() {
    return '''
classes: ${classes},
classesSelecionadas: ${classesSelecionadas}
    ''';
  }
}
