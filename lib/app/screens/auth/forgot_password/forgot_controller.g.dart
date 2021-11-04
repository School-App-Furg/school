// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ForgotController on _ForgotControllerBase, Store {
  final _$emailAtom = Atom(name: '_ForgotControllerBase.email');

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

  final _$_ForgotControllerBaseActionController =
      ActionController(name: '_ForgotControllerBase');

  @override
  dynamic validateEmail(String value) {
    final _$actionInfo = _$_ForgotControllerBaseActionController.startAction(
        name: '_ForgotControllerBase.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$_ForgotControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email}
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

  @override
  String toString() {
    return '''
email: ${email},
hasErrors: ${hasErrors}
    ''';
  }
}
