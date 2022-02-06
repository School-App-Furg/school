// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_student_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterStudentController on _RegisterStudentControllerBase, Store {
  final _$obscureTextAtom =
      Atom(name: '_RegisterStudentControllerBase.obscureText');

  @override
  bool get obscureText {
    _$obscureTextAtom.reportRead();
    return super.obscureText;
  }

  @override
  set obscureText(bool value) {
    _$obscureTextAtom.reportWrite(value, super.obscureText, () {
      super.obscureText = value;
    });
  }

  final _$listOfSchoolsAtom =
      Atom(name: '_RegisterStudentControllerBase.listOfSchools');

  @override
  List<SchoolModel?> get listOfSchools {
    _$listOfSchoolsAtom.reportRead();
    return super.listOfSchools;
  }

  @override
  set listOfSchools(List<SchoolModel?> value) {
    _$listOfSchoolsAtom.reportWrite(value, super.listOfSchools, () {
      super.listOfSchools = value;
    });
  }

  final _$schoolAtom = Atom(name: '_RegisterStudentControllerBase.school');

  @override
  String get school {
    _$schoolAtom.reportRead();
    return super.school;
  }

  @override
  set school(String value) {
    _$schoolAtom.reportWrite(value, super.school, () {
      super.school = value;
    });
  }

  final _$getSchoolsAsyncAction =
      AsyncAction('_RegisterStudentControllerBase.getSchools');

  @override
  Future getSchools() {
    return _$getSchoolsAsyncAction.run(() => super.getSchools());
  }

  final _$_RegisterStudentControllerBaseActionController =
      ActionController(name: '_RegisterStudentControllerBase');

  @override
  void mostrarSenhaUser() {
    final _$actionInfo = _$_RegisterStudentControllerBaseActionController
        .startAction(name: '_RegisterStudentControllerBase.mostrarSenhaUser');
    try {
      return super.mostrarSenhaUser();
    } finally {
      _$_RegisterStudentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSchool(String? value) {
    final _$actionInfo = _$_RegisterStudentControllerBaseActionController
        .startAction(name: '_RegisterStudentControllerBase.setSchool');
    try {
      return super.setSchool(value);
    } finally {
      _$_RegisterStudentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
obscureText: ${obscureText},
listOfSchools: ${listOfSchools},
school: ${school}
    ''';
  }
}
