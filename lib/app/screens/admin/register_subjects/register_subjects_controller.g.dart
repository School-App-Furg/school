// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_subjects_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterSubjectsController on _RegisterSubjectsControllerBase, Store {
  final _$subjectsAtom = Atom(name: '_RegisterSubjectsControllerBase.subjects');

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

  final _$cadastrarAsyncAction =
      AsyncAction('_RegisterSubjectsControllerBase.cadastrar');

  @override
  Future cadastrar(BuildContext context) {
    return _$cadastrarAsyncAction.run(() => super.cadastrar(context));
  }

  final _$getSubjectsAsyncAction =
      AsyncAction('_RegisterSubjectsControllerBase.getSubjects');

  @override
  Future<dynamic> getSubjects(BuildContext context) {
    return _$getSubjectsAsyncAction.run(() => super.getSubjects(context));
  }

  final _$excluirAsyncAction =
      AsyncAction('_RegisterSubjectsControllerBase.excluir');

  @override
  Future excluir(BuildContext context, String idSubject) {
    return _$excluirAsyncAction.run(() => super.excluir(context, idSubject));
  }

  @override
  String toString() {
    return '''
subjects: ${subjects}
    ''';
  }
}
