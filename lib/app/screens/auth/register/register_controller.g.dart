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

  final _$cnpjAtom = Atom(name: '_RegisterControllerBase.cnpj');

  @override
  String get cnpj {
    _$cnpjAtom.reportRead();
    return super.cnpj;
  }

  @override
  set cnpj(String value) {
    _$cnpjAtom.reportWrite(value, super.cnpj, () {
      super.cnpj = value;
    });
  }

  final _$emailAtom = Atom(name: '_RegisterControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$senhaAtom = Atom(name: '_RegisterControllerBase.senha');

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  final _$validateNomeEscolaAsyncAction =
      AsyncAction('_RegisterControllerBase.validateNomeEscola');

  @override
  Future<dynamic> validateNomeEscola(String value) {
    return _$validateNomeEscolaAsyncAction
        .run(() => super.validateNomeEscola(value));
  }

  final _$_RegisterControllerBaseActionController =
      ActionController(name: '_RegisterControllerBase');

  @override
  dynamic validateCnpj(String value) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.validateCnpj');
    try {
      return super.validateCnpj(value);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validateEmail(String value) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validateSenha(String value) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.validateSenha');
    try {
      return super.validateSenha(value);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nomeEscola: ${nomeEscola},
cnpj: ${cnpj},
email: ${email},
senha: ${senha}
    ''';
  }
}

mixin _$FormErrorState on _FormErrorState, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_FormErrorState.hasErrors'))
          .value;

  final _$nomeEscolaAtom = Atom(name: '_FormErrorState.nomeEscola');

  @override
  String? get nomeEscola {
    _$nomeEscolaAtom.reportRead();
    return super.nomeEscola;
  }

  @override
  set nomeEscola(String? value) {
    _$nomeEscolaAtom.reportWrite(value, super.nomeEscola, () {
      super.nomeEscola = value;
    });
  }

  final _$cnpjAtom = Atom(name: '_FormErrorState.cnpj');

  @override
  String? get cnpj {
    _$cnpjAtom.reportRead();
    return super.cnpj;
  }

  @override
  set cnpj(String? value) {
    _$cnpjAtom.reportWrite(value, super.cnpj, () {
      super.cnpj = value;
    });
  }

  final _$emailAtom = Atom(name: '_FormErrorState.email');

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$senhaAtom = Atom(name: '_FormErrorState.senha');

  @override
  String? get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String? value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  @override
  String toString() {
    return '''
nomeEscola: ${nomeEscola},
cnpj: ${cnpj},
email: ${email},
senha: ${senha},
hasErrors: ${hasErrors}
    ''';
  }
}
