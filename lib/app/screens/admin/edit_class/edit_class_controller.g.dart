// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_class_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditClassController on _EditClassControllerBase, Store {
  final _$classesReceivedAtom =
      Atom(name: '_EditClassControllerBase.classesReceived');

  @override
  Classes get classesReceived {
    _$classesReceivedAtom.reportRead();
    return super.classesReceived;
  }

  @override
  set classesReceived(Classes value) {
    _$classesReceivedAtom.reportWrite(value, super.classesReceived, () {
      super.classesReceived = value;
    });
  }

  final _$listOfStudentsSelectedAtom =
      Atom(name: '_EditClassControllerBase.listOfStudentsSelected');

  @override
  List<StudentUser> get listOfStudentsSelected {
    _$listOfStudentsSelectedAtom.reportRead();
    return super.listOfStudentsSelected;
  }

  @override
  set listOfStudentsSelected(List<StudentUser> value) {
    _$listOfStudentsSelectedAtom
        .reportWrite(value, super.listOfStudentsSelected, () {
      super.listOfStudentsSelected = value;
    });
  }

  final _$listOfSubjectTeachersSelectedAtom =
      Atom(name: '_EditClassControllerBase.listOfSubjectTeachersSelected');

  @override
  List<SubjectTeacher> get listOfSubjectTeachersSelected {
    _$listOfSubjectTeachersSelectedAtom.reportRead();
    return super.listOfSubjectTeachersSelected;
  }

  @override
  set listOfSubjectTeachersSelected(List<SubjectTeacher> value) {
    _$listOfSubjectTeachersSelectedAtom
        .reportWrite(value, super.listOfSubjectTeachersSelected, () {
      super.listOfSubjectTeachersSelected = value;
    });
  }

  final _$studentsAtom = Atom(name: '_EditClassControllerBase.students');

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
      Atom(name: '_EditClassControllerBase.studentsSelected');

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

  final _$subjectsAtom = Atom(name: '_EditClassControllerBase.subjects');

  @override
  List<Subject> get subjects {
    _$subjectsAtom.reportRead();
    return super.subjects;
  }

  @override
  set subjects(List<Subject> value) {
    _$subjectsAtom.reportWrite(value, super.subjects, () {
      super.subjects = value;
    });
  }

  final _$teachersAtom = Atom(name: '_EditClassControllerBase.teachers');

  @override
  List<TeacherUser> get teachers {
    _$teachersAtom.reportRead();
    return super.teachers;
  }

  @override
  set teachers(List<TeacherUser> value) {
    _$teachersAtom.reportWrite(value, super.teachers, () {
      super.teachers = value;
    });
  }

  final _$subjectTeacherAtom =
      Atom(name: '_EditClassControllerBase.subjectTeacher');

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

  final _$loadingTestAtom = Atom(name: '_EditClassControllerBase.loadingTest');

  @override
  bool get loadingTest {
    _$loadingTestAtom.reportRead();
    return super.loadingTest;
  }

  @override
  set loadingTest(bool value) {
    _$loadingTestAtom.reportWrite(value, super.loadingTest, () {
      super.loadingTest = value;
    });
  }

  final _$subjectsTeacherSelectedAtom =
      Atom(name: '_EditClassControllerBase.subjectsTeacherSelected');

  @override
  List<SubjectTeacher> get subjectsTeacherSelected {
    _$subjectsTeacherSelectedAtom.reportRead();
    return super.subjectsTeacherSelected;
  }

  @override
  set subjectsTeacherSelected(List<SubjectTeacher> value) {
    _$subjectsTeacherSelectedAtom
        .reportWrite(value, super.subjectsTeacherSelected, () {
      super.subjectsTeacherSelected = value;
    });
  }

  final _$initEditClassAsyncAction =
      AsyncAction('_EditClassControllerBase.initEditClass');

  @override
  Future initEditClass(Classes classes) {
    return _$initEditClassAsyncAction.run(() => super.initEditClass(classes));
  }

  final _$getSubjectsTeacherPreviusSelectedAsyncAction =
      AsyncAction('_EditClassControllerBase.getSubjectsTeacherPreviusSelected');

  @override
  Future getSubjectsTeacherPreviusSelected(Classes classes) {
    return _$getSubjectsTeacherPreviusSelectedAsyncAction
        .run(() => super.getSubjectsTeacherPreviusSelected(classes));
  }

  final _$getSubjectsAndTeachersAsyncAction =
      AsyncAction('_EditClassControllerBase.getSubjectsAndTeachers');

  @override
  Future<dynamic> getSubjectsAndTeachers() {
    return _$getSubjectsAndTeachersAsyncAction
        .run(() => super.getSubjectsAndTeachers());
  }

  final _$_EditClassControllerBaseActionController =
      ActionController(name: '_EditClassControllerBase');

  @override
  dynamic getStudentsPreviusSelected(Classes classes) {
    final _$actionInfo = _$_EditClassControllerBaseActionController.startAction(
        name: '_EditClassControllerBase.getStudentsPreviusSelected');
    try {
      return super.getStudentsPreviusSelected(classes);
    } finally {
      _$_EditClassControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setStudentsSelected(List<dynamic> values) {
    final _$actionInfo = _$_EditClassControllerBaseActionController.startAction(
        name: '_EditClassControllerBase.setStudentsSelected');
    try {
      return super.setStudentsSelected(values);
    } finally {
      _$_EditClassControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSubjectsSelected(List<dynamic> values) {
    final _$actionInfo = _$_EditClassControllerBaseActionController.startAction(
        name: '_EditClassControllerBase.setSubjectsSelected');
    try {
      return super.setSubjectsSelected(values);
    } finally {
      _$_EditClassControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
classesReceived: ${classesReceived},
listOfStudentsSelected: ${listOfStudentsSelected},
listOfSubjectTeachersSelected: ${listOfSubjectTeachersSelected},
students: ${students},
studentsSelected: ${studentsSelected},
subjects: ${subjects},
teachers: ${teachers},
subjectTeacher: ${subjectTeacher},
loadingTest: ${loadingTest},
subjectsTeacherSelected: ${subjectsTeacherSelected}
    ''';
  }
}
