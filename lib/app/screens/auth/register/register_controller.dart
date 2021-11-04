import 'package:mobx/mobx.dart';
import 'package:validators2/validators.dart';
import 'package:flux_validator_dart/flux_validator_dart.dart';
part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final FormErrorState error = FormErrorState();

  //-----------------------------------------

  @observable
  String nomeEscola = "";

  @action
  Future validateNomeEscola(String value) async {
    if (isNull(value) || value.isEmpty) {
      error.nomeEscola = 'Campo obrigatório';
      return;
    }
    error.nomeEscola = null;
  }

  //-----------------------------------------

  @observable
  String cnpj = "";

  @action
  validateCnpj(String value) {
    if (Validator.cnpj(value)) {
      error.cnpj = "CNPJ inválido";
      return;
    }
    error.cnpj = null;
  }

  //-----------------------------------------

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

  @observable
  String senha = "";

  @action
  validateSenha(String value) {
    error.senha =
        isNull(value) || value.isEmpty ? 'Senha precisa ser preenchida' : null;
  }

  //-----------------------------------------

  late List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => nomeEscola, validateNomeEscola),
      reaction((_) => cnpj, validateCnpj),
      reaction((_) => email, validateEmail),
      reaction((_) => senha, validateSenha)
    ];
  }

  cadastrar() {
    // ignore: unnecessary_null_comparison
    if ((validateNomeEscola(nomeEscola) != null) ||
        (validateEmail(email) != null) ||
        (validateCnpj(cnpj) != null) ||
        (validateSenha(senha)) != null) {}
  }
}

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String? nomeEscola;

  @observable
  String? cnpj;

  @observable
  String? email;

  @observable
  String? senha;

  @computed
  bool get hasErrors =>
      nomeEscola != null || cnpj != null || email != null || senha != null;
}
