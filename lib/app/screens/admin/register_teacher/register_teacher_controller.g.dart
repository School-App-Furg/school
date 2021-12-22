// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_teacher_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterTeacherController on _RegisterTeacherControllerBase, Store {
  final _$subjectsAtom = Atom(name: '_RegisterTeacherControllerBase.subjects');

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
      Atom(name: '_RegisterTeacherControllerBase.subjectsSelected');

  @override
  List<String> get subjectsSelected {
    _$subjectsSelectedAtom.reportRead();
    return super.subjectsSelected;
  }

  @override
  set subjectsSelected(List<String> value) {
    _$subjectsSelectedAtom.reportWrite(value, super.subjectsSelected, () {
      super.subjectsSelected = value;
    });
  }

  final _$teachersAtom = Atom(name: '_RegisterTeacherControllerBase.teachers');

  @override
  List<TeacherUser>? get teachers {
    _$teachersAtom.reportRead();
    return super.teachers;
  }

  @override
  set teachers(List<TeacherUser>? value) {
    _$teachersAtom.reportWrite(value, super.teachers, () {
      super.teachers = value;
    });
  }

  final _$getSubjectsAsyncAction =
      AsyncAction('_RegisterTeacherControllerBase.getSubjects');

  @override
  Future getSubjects() {
    return _$getSubjectsAsyncAction.run(() => super.getSubjects());
  }

  final _$getTeachersAsyncAction =
      AsyncAction('_RegisterTeacherControllerBase.getTeachers');

  @override
  Future<dynamic> getTeachers(BuildContext context) {
    return _$getTeachersAsyncAction.run(() => super.getTeachers(context));
  }

  final _$excluirAsyncAction =
      AsyncAction('_RegisterTeacherControllerBase.excluir');

  @override
  Future excluir(BuildContext context, String idTeacher) {
    return _$excluirAsyncAction.run(() => super.excluir(context, idTeacher));
  }

  final _$_RegisterTeacherControllerBaseActionController =
      ActionController(name: '_RegisterTeacherControllerBase');

  @override
  dynamic setSubjectsSelected(List<dynamic> values) {
    final _$actionInfo =
        _$_RegisterTeacherControllerBaseActionController.startAction(
            name: '_RegisterTeacherControllerBase.setSubjectsSelected');
    try {
      return super.setSubjectsSelected(values);
    } finally {
      _$_RegisterTeacherControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
subjects: ${subjects},
subjectsSelected: ${subjectsSelected},
teachers: ${teachers}
    ''';
  }
}
