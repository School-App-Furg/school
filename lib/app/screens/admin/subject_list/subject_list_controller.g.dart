// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SubjectsListController on _SubjectsListControllerBase, Store {
  final _$loadingAtom = Atom(name: '_SubjectsListControllerBase.loading');

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

  final _$subjectsAtom = Atom(name: '_SubjectsListControllerBase.subjects');

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
      AsyncAction('_SubjectsListControllerBase.cadastrar');

  @override
  Future cadastrar(BuildContext context) {
    return _$cadastrarAsyncAction.run(() => super.cadastrar(context));
  }

  final _$getSubjectsAsyncAction =
      AsyncAction('_SubjectsListControllerBase.getSubjects');

  @override
  Future<dynamic> getSubjects(BuildContext context) {
    return _$getSubjectsAsyncAction.run(() => super.getSubjects(context));
  }

  final _$excluirAsyncAction =
      AsyncAction('_SubjectsListControllerBase.excluir');

  @override
  Future excluir(BuildContext context, String idSubject) {
    return _$excluirAsyncAction.run(() => super.excluir(context, idSubject));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
subjects: ${subjects}
    ''';
  }
}
