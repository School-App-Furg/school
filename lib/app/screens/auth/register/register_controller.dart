import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

  num cnpj = 0;

  String email = "";

  String senha = "";

  setCnpj(value) {
    cnpj = value;
  }

  setEmail(value) {
    email = value;
  }

  setSenha(value) {
    senha = value;
  }

  cadastrar() {
    validateNomeEscola(nomeEscola);
    if (validateNomeEscola(nomeEscola) == true) {}
  }
}
