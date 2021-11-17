// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
<<<<<<< HEAD
  final _$isLoadingAtom = Atom(name: '_LoginControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
=======
  final _$emailControllerAtom =
      Atom(name: '_LoginControllerBase.emailController');

  @override
  TextEditingController get emailController {
    _$emailControllerAtom.reportRead();
    return super.emailController;
  }

  @override
  set emailController(TextEditingController value) {
    _$emailControllerAtom.reportWrite(value, super.emailController, () {
      super.emailController = value;
    });
  }

  final _$senhaControllerAtom =
      Atom(name: '_LoginControllerBase.senhaController');

  @override
  TextEditingController get senhaController {
    _$senhaControllerAtom.reportRead();
    return super.senhaController;
  }

  @override
  set senhaController(TextEditingController value) {
    _$senhaControllerAtom.reportWrite(value, super.senhaController, () {
      super.senhaController = value;
    });
  }

  final _$formKeyAtom = Atom(name: '_LoginControllerBase.formKey');

  @override
  GlobalKey<FormState> get formKey {
    _$formKeyAtom.reportRead();
    return super.formKey;
  }

  @override
  set formKey(GlobalKey<FormState> value) {
    _$formKeyAtom.reportWrite(value, super.formKey, () {
      super.formKey = value;
>>>>>>> develop
    });
  }

  final _$obscureTextAtom = Atom(name: '_LoginControllerBase.obscureText');

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

  final _$loginAsyncAction = AsyncAction('_LoginControllerBase.login');

  @override
  Future<dynamic> login(BuildContext context) {
    return _$loginAsyncAction.run(() => super.login(context));
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  void mostrarSenhaUser() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.mostrarSenhaUser');
    try {
      return super.mostrarSenhaUser();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
<<<<<<< HEAD
isLoading: ${isLoading},
=======
emailController: ${emailController},
senhaController: ${senhaController},
formKey: ${formKey},
>>>>>>> develop
obscureText: ${obscureText}
    ''';
  }
}
