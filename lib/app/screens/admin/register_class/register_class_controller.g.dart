// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_class_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterClassController on _RegisterClassControllerBase, Store {
  final _$studentsAtom = Atom(name: '_RegisterClassControllerBase.students');

  @override
  List<StudentUser> get students {
    _$studentsAtom.reportRead();
    return super.students;
  }

  @override
  set students(List<StudentUser> value) {
    _$studentsAtom.reportWrite(value, super.students, () {
      super.students = value;
    });
  }

  final _$studentsSelectedAtom =
      Atom(name: '_RegisterClassControllerBase.studentsSelected');

  @override
  List<String> get studentsSelected {
    _$studentsSelectedAtom.reportRead();
    return super.studentsSelected;
  }

  @override
  set studentsSelected(List<String> value) {
    _$studentsSelectedAtom.reportWrite(value, super.studentsSelected, () {
      super.studentsSelected = value;
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

  final _$teachersAtom = Atom(name: '_RegisterClassControllerBase.teachers');

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

  final _$subjectTeacherAtom =
      Atom(name: '_RegisterClassControllerBase.subjectTeacher');

  @override
  List<SubjectTeacher> get subjectTeacher {
    _$subjectTeacherAtom.reportRead();
    return super.subjectTeacher;
  }

  @override
  set subjectTeacher(List<SubjectTeacher> value) {
    _$subjectTeacherAtom.reportWrite(value, super.subjectTeacher, () {
      super.subjectTeacher = value;
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

  final _$getStudentsAsyncAction =
      AsyncAction('_RegisterClassControllerBase.getStudents');

  @override
  Future<dynamic> getStudents() {
    return _$getStudentsAsyncAction.run(() => super.getStudents());
  }

  final _$getSubjectsAndTeachersAsyncAction =
      AsyncAction('_RegisterClassControllerBase.getSubjectsAndTeachers');

  @override
  Future<dynamic> getSubjectsAndTeachers() {
    return _$getSubjectsAndTeachersAsyncAction
        .run(() => super.getSubjectsAndTeachers());
  }

  final _$_RegisterClassControllerBaseActionController =
      ActionController(name: '_RegisterClassControllerBase');

  @override
  dynamic setStudentsSelected(List<dynamic> values) {
    final _$actionInfo = _$_RegisterClassControllerBaseActionController
        .startAction(name: '_RegisterClassControllerBase.setStudentsSelected');
    try {
      return super.setStudentsSelected(values);
    } finally {
      _$_RegisterClassControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSubjectsSelected(List<dynamic> values) {
    final _$actionInfo = _$_RegisterClassControllerBaseActionController
        .startAction(name: '_RegisterClassControllerBase.setSubjectsSelected');
    try {
      return super.setSubjectsSelected(values);
    } finally {
      _$_RegisterClassControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
students: ${students},
studentsSelected: ${studentsSelected},
subjects: ${subjects},
teachers: ${teachers},
subjectTeacher: ${subjectTeacher},
subjectsSelected: ${subjectsSelected}
    ''';
  }
}
