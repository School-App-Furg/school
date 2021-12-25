// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_teacher_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditTeacherController on _EditTeacherControllerBase, Store {
  final _$listOfsubjectsAtom =
      Atom(name: '_EditTeacherControllerBase.listOfsubjects');

  @override
  List<Subject>? get listOfsubjects {
    _$listOfsubjectsAtom.reportRead();
    return super.listOfsubjects;
  }

  @override
  set listOfsubjects(List<Subject>? value) {
    _$listOfsubjectsAtom.reportWrite(value, super.listOfsubjects, () {
      super.listOfsubjects = value;
    });
  }

  final _$listOfSubjectsSelectedAtom =
      Atom(name: '_EditTeacherControllerBase.listOfSubjectsSelected');

  @override
  List<Subject>? get listOfSubjectsSelected {
    _$listOfSubjectsSelectedAtom.reportRead();
    return super.listOfSubjectsSelected;
  }

  @override
  set listOfSubjectsSelected(List<Subject>? value) {
    _$listOfSubjectsSelectedAtom
        .reportWrite(value, super.listOfSubjectsSelected, () {
      super.listOfSubjectsSelected = value;
    });
  }

  final _$subjectsSelectedAtom =
      Atom(name: '_EditTeacherControllerBase.subjectsSelected');

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

  final _$getSubjectsAsyncAction =
      AsyncAction('_EditTeacherControllerBase.getSubjects');

  @override
  Future getSubjects() {
    return _$getSubjectsAsyncAction.run(() => super.getSubjects());
  }

  final _$excluirAsyncAction =
      AsyncAction('_EditTeacherControllerBase.excluir');

  @override
  Future excluir(BuildContext context, String idTeacher) {
    return _$excluirAsyncAction.run(() => super.excluir(context, idTeacher));
  }

  final _$_EditTeacherControllerBaseActionController =
      ActionController(name: '_EditTeacherControllerBase');

  @override
  dynamic initEditPage(TeacherUser teacherUser) {
    final _$actionInfo = _$_EditTeacherControllerBaseActionController
        .startAction(name: '_EditTeacherControllerBase.initEditPage');
    try {
      return super.initEditPage(teacherUser);
    } finally {
      _$_EditTeacherControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSubjectsSelected(List<dynamic> values) {
    final _$actionInfo = _$_EditTeacherControllerBaseActionController
        .startAction(name: '_EditTeacherControllerBase.setSubjectsSelected');
    try {
      return super.setSubjectsSelected(values);
    } finally {
      _$_EditTeacherControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listOfsubjects: ${listOfsubjects},
listOfSubjectsSelected: ${listOfSubjectsSelected},
subjectsSelected: ${subjectsSelected}
    ''';
  }
}
