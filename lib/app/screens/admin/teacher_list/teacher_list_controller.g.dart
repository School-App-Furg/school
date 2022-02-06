// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TeacherListController on _TeacherListControllerBase, Store {
  final _$loadingAtom = Atom(name: '_TeacherListControllerBase.loading');

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

  final _$teachersAtom = Atom(name: '_TeacherListControllerBase.teachers');

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

  final _$getTeachersAsyncAction =
      AsyncAction('_TeacherListControllerBase.getTeachers');

  @override
  Future<dynamic> getTeachers(BuildContext context) {
    return _$getTeachersAsyncAction.run(() => super.getTeachers(context));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
teachers: ${teachers}
    ''';
  }
}
