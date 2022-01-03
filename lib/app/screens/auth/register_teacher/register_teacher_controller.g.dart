// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_teacher_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterTeacherController on _RegisterTeacherControllerBase, Store {
  final _$obscureTextAtom =
      Atom(name: '_RegisterTeacherControllerBase.obscureText');

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
      Atom(name: '_RegisterTeacherControllerBase.listOfSchools');

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

  final _$schoolAtom = Atom(name: '_RegisterTeacherControllerBase.school');

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
      AsyncAction('_RegisterTeacherControllerBase.getSchools');

  @override
  Future getSchools() {
    return _$getSchoolsAsyncAction.run(() => super.getSchools());
  }

  final _$_RegisterTeacherControllerBaseActionController =
      ActionController(name: '_RegisterTeacherControllerBase');

  @override
  void mostrarSenhaUser() {
    final _$actionInfo = _$_RegisterTeacherControllerBaseActionController
        .startAction(name: '_RegisterTeacherControllerBase.mostrarSenhaUser');
    try {
      return super.mostrarSenhaUser();
    } finally {
      _$_RegisterTeacherControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSchool(String? value) {
    final _$actionInfo = _$_RegisterTeacherControllerBaseActionController
        .startAction(name: '_RegisterTeacherControllerBase.setSchool');
    try {
      return super.setSchool(value);
    } finally {
      _$_RegisterTeacherControllerBaseActionController.endAction(_$actionInfo);
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
