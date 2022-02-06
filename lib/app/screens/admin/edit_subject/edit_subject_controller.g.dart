// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_subject_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditSubjectController on _EditSubjectControllerBase, Store {
  final _$_subjectReceivedAtom =
      Atom(name: '_EditSubjectControllerBase._subjectReceived');

  @override
  Subject get _subjectReceived {
    _$_subjectReceivedAtom.reportRead();
    return super._subjectReceived;
  }

  @override
  set _subjectReceived(Subject value) {
    _$_subjectReceivedAtom.reportWrite(value, super._subjectReceived, () {
      super._subjectReceived = value;
    });
  }

  final _$loadingAtom = Atom(name: '_EditSubjectControllerBase.loading');

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

  final _$initEditPageAsyncAction =
      AsyncAction('_EditSubjectControllerBase.initEditPage');

  @override
  Future initEditPage(Subject subject) {
    return _$initEditPageAsyncAction.run(() => super.initEditPage(subject));
  }

  final _$updateAsyncAction = AsyncAction('_EditSubjectControllerBase.update');

  @override
  Future update(BuildContext context) {
    return _$updateAsyncAction.run(() => super.update(context));
  }

  @override
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}
