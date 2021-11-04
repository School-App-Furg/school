import 'package:mobx/mobx.dart';
import 'package:validators2/validators.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final FormErrorState error = FormErrorState();

  @observable
  String email = "";

  @action
  validateEmail(String value) {
    error.email = isEmail(value) ? null : 'E-mail inválido';
  }

  //-----------------------------------------

  @observable
  String senha = "";

  @action
  validateSenha(String value) {
    error.senha =
        isNull(value) || value.isEmpty ? 'Senha precisa ser preenchida' : null;
  }

  //-----------------------------------------

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  late List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => email, validateEmail),
      reaction((_) => senha, validateSenha)
    ];
  }

  login() {
    if ((validateEmail(email) != null) || (validateSenha(senha)) != null) {}
  }
}

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String? email;

  @observable
  String? senha;

  @computed
  bool get hasErrors => email != null || senha != null;
}
