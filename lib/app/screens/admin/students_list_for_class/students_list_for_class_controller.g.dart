// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'students_list_for_class_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StudentsListForClassController
    on _StudentsListForClassControllerBase, Store {
  final _$loadingAtom =
      Atom(name: '_StudentsListForClassControllerBase.loading');

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

  final _$studentsAtom =
      Atom(name: '_StudentsListForClassControllerBase.students');

  @override
  List<StudentUser?> get students {
    _$studentsAtom.reportRead();
    return super.students;
  }

  @override
  set students(List<StudentUser?> value) {
    _$studentsAtom.reportWrite(value, super.students, () {
      super.students = value;
    });
  }

  final _$initPageAsyncAction =
      AsyncAction('_StudentsListForClassControllerBase.initPage');

  @override
  Future<dynamic> initPage(BuildContext context, Classes classes) {
    return _$initPageAsyncAction.run(() => super.initPage(context, classes));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
students: ${students}
    ''';
  }
}
