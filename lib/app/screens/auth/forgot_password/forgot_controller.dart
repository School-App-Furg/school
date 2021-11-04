import 'package:mobx/mobx.dart';
import 'package:validators2/validators.dart';
part 'forgot_controller.g.dart';

class ForgotController = _ForgotControllerBase with _$ForgotController;

abstract class _ForgotControllerBase with Store {
  final FormErrorState error = FormErrorState();

  @observable
  String email = "";

  @action
  validateEmail(String value) {
    error.email = isEmail(value) ? null : 'E-mail inválido';
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  //-----------------------------------------

  late List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => email, validateEmail),
    ];
  }

  recuperarSenha() {
    if (validateEmail(email) != null) {}
  }
}

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String? email;

  @computed
  bool get hasErrors => email != null;
}
