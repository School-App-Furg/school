// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterController on _RegisterControllerBase, Store {
  final _$nomeEscolaAtom = Atom(name: '_RegisterControllerBase.nomeEscola');

  @override
  String get nomeEscola {
    _$nomeEscolaAtom.reportRead();
    return super.nomeEscola;
  }

  @override
  set nomeEscola(String value) {
    _$nomeEscolaAtom.reportWrite(value, super.nomeEscola, () {
      super.nomeEscola = value;
    });
  }

  final _$nomeEscolaErrorAtom =
      Atom(name: '_RegisterControllerBase.nomeEscolaError');

  @override
  bool get nomeEscolaError {
    _$nomeEscolaErrorAtom.reportRead();
    return super.nomeEscolaError;
  }

  @override
  set nomeEscolaError(bool value) {
    _$nomeEscolaErrorAtom.reportWrite(value, super.nomeEscolaError, () {
      super.nomeEscolaError = value;
    });
  }

  final _$_RegisterControllerBaseActionController =
      ActionController(name: '_RegisterControllerBase');

  @override
  dynamic setNomeEscola(dynamic value) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.setNomeEscola');
    try {
      return super.setNomeEscola(value);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validateNomeEscola(String value) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.validateNomeEscola');
    try {
      return super.validateNomeEscola(value);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nomeEscola: ${nomeEscola},
nomeEscolaError: ${nomeEscolaError}
    ''';
  }
}
