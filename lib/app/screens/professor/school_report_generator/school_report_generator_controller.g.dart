// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_report_generator_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SchoolReportGeneratorController
    on _SchoolReportGeneratorControllerBase, Store {
  final _$studentsSelectedAtom =
      Atom(name: '_SchoolReportGeneratorControllerBase.studentsSelected');

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

  final _$_SchoolReportGeneratorControllerBaseActionController =
      ActionController(name: '_SchoolReportGeneratorControllerBase');

  @override
  dynamic setStudentsSelected(List<dynamic> values) {
    final _$actionInfo =
        _$_SchoolReportGeneratorControllerBaseActionController.startAction(
            name: '_SchoolReportGeneratorControllerBase.setStudentsSelected');
    try {
      return super.setStudentsSelected(values);
    } finally {
      _$_SchoolReportGeneratorControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
studentsSelected: ${studentsSelected}
    ''';
  }
}
