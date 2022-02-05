// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_grades_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddGradesController on _AddGradesControllerBase, Store {
  final _$loadingAtom = Atom(name: '_AddGradesControllerBase.loading');

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

  final _$classeAtom = Atom(name: '_AddGradesControllerBase.classe');

  @override
  Classes get classe {
    _$classeAtom.reportRead();
    return super.classe;
  }

  @override
  set classe(Classes value) {
    _$classeAtom.reportWrite(value, super.classe, () {
      super.classe = value;
    });
  }

  final _$studentsAtom = Atom(name: '_AddGradesControllerBase.students');

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
      Atom(name: '_AddGradesControllerBase.studentsSelected');

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

  final _$listOfStudentsSelectedAtom =
      Atom(name: '_AddGradesControllerBase.listOfStudentsSelected');

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

  final _$cyclePeriodAtom = Atom(name: '_AddGradesControllerBase.cyclePeriod');

  @override
  String get cyclePeriod {
    _$cyclePeriodAtom.reportRead();
    return super.cyclePeriod;
  }

  @override
  set cyclePeriod(String value) {
    _$cyclePeriodAtom.reportWrite(value, super.cyclePeriod, () {
      super.cyclePeriod = value;
    });
  }

  final _$initAddGradesAsyncAction =
      AsyncAction('_AddGradesControllerBase.initAddGrades');

  @override
  Future initAddGrades(Classes classeReceived, Cycle cycleReceived,
      SubjectTeacher subjectTeacherReceived, List<Grade> gradesReceived) {
    return _$initAddGradesAsyncAction.run(() => super.initAddGrades(
        classeReceived, cycleReceived, subjectTeacherReceived, gradesReceived));
  }

  final _$insertAsyncAction = AsyncAction('_AddGradesControllerBase.insert');

  @override
  Future insert(BuildContext context) {
    return _$insertAsyncAction.run(() => super.insert(context));
  }

  final _$_AddGradesControllerBaseActionController =
      ActionController(name: '_AddGradesControllerBase');

  @override
  dynamic setStudentsSelected(List<dynamic> values) {
    final _$actionInfo = _$_AddGradesControllerBaseActionController.startAction(
        name: '_AddGradesControllerBase.setStudentsSelected');
    try {
      return super.setStudentsSelected(values);
    } finally {
      _$_AddGradesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCycleSelected(dynamic e) {
    final _$actionInfo = _$_AddGradesControllerBaseActionController.startAction(
        name: '_AddGradesControllerBase.setCycleSelected');
    try {
      return super.setCycleSelected(e);
    } finally {
      _$_AddGradesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int getCyclePeriod(String e) {
    final _$actionInfo = _$_AddGradesControllerBaseActionController.startAction(
        name: '_AddGradesControllerBase.getCyclePeriod');
    try {
      return super.getCyclePeriod(e);
    } finally {
      _$_AddGradesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
classe: ${classe},
students: ${students},
studentsSelected: ${studentsSelected},
listOfStudentsSelected: ${listOfStudentsSelected},
cyclePeriod: ${cyclePeriod}
    ''';
  }
}
