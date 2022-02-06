import 'package:flux_validator_dart/flux_validator_dart.dart';
import 'package:validators2/validators.dart';

//valida email
String? validateEmail(value) {
  return isEmail(value) ? null : 'E-mail inválido';
}

//valida campos vazios
String? validateEmpty(value) {
  if (value!.isEmpty) {
    return 'Dados obrigatórios';
  }
  return null;
}

//valida nota retornando erro se for superior a 10
String? validateNote10(value) {
  if (double.parse(value) > 10) {
    return 'Nota inválida';
  }
  return null;
}

//valida seleção vazia no multiselect
String? validateEmptyMultiSelect(value) {
  if (value == null || value.isEmpty) {
    return 'Dados obrigatórios';
  }
  return null;
}

//valida cnpj
String? validateCnpj(value) {
  if (value!.isEmpty) {
    return 'Dados obrigatórios';
  } else if (Validator.cnpj(value)) {
    return "CNPJ inválido";
  }
  return null;
}

//valida cpf
String? validateCpf(value) {
  if (value!.isEmpty) {
    return 'Dados obrigatórios';
  } else if (Validator.cpf(value)) {
    return "CPF inválido";
  }
  return null;
}

//valida senha se nula
String? validateSenha(value) {
  if (isNull(value) || value.isEmpty)
    return 'Senha precisa ser preenchida';
  else if (value.length < 6)
    return 'Mínimo 6 caracteres';
  else
    return null;
}
