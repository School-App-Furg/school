import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

bool validateAndSave(GlobalKey<FormState> formKey) {
  final FormState? form = formKey.currentState;
  if (form!.validate()) {
    form.save();
    return true;
  }
  return false;
}

String validateEmail(String? value) {
  return (EmailValidator.validate(value!)) ? "" : "Email inválido!";
}

String validateSenha(String? value) {
  return value!.length > 6 ? "" : 'Senha deve conter mais de 6 caracteres';
}

String validateEmptyField(String? value) {
  return 'Campo não pode ser vazio!';
}
