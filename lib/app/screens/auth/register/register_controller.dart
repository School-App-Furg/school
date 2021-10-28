import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:mobx/mobx.dart';
part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  @observable
  String nomeEscola = "";

  @observable
  bool nomeEscolaError = false;

  @action
  setNomeEscola(value) {
    nomeEscola = value;
  }

  @action
  validateNomeEscola(String value) {
    if (value.isNotEmpty) {
      return true;
    } else {
      nomeEscolaError = true;
      return false;
    }
  }

  //---------------------------------------------------
  @observable
  num cnpj = 0;

  @action
  setCnpjEscola(value) {
    cnpj = value;
  }

  @action
  validateCnpj(String value) {
    CNPJValidator.isValid(value);
  }

  //---------------------------------------------------

  @observable
  String email = "";

  @action
  setEmail(value) {
    email = value;
  }

  @action
  validateEmail(value) {
    EmailValidator(errorText: 'Digite um email válido');
  }

  //---------------------------------------------------
  @observable
  String senha = "";

  @action
  setSenha(value) {
    senha = value;
  }

  @action
  validateSenha(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  //---------------------------------------------------

  cadastrar() {
    validateNomeEscola(nomeEscola);
    if (validateNomeEscola(nomeEscola) == true) {}
  }
}
