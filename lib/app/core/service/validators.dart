import 'package:flux_validator_dart/flux_validator_dart.dart';
import 'package:validators2/validators.dart';

String? validateEmail(value) {
  return isEmail(value) ? null : 'E-mail inválido';
}

String? validateEmpty(value) {
  if (value!.isEmpty) {
    return 'Dados obrigatórios';
  }
  return null;
}

String? validateEmptyMultiSelect(value) {
  if (value == null || value.isEmpty) {
    return 'Dados obrigatórios';
  }
  return null;
}

String? validateCnpj(value) {
  if (value!.isEmpty) {
    return 'Dados obrigatórios';
  } else if (Validator.cnpj(value)) {
    return "CNPJ inválido";
  }
  return null;
}

String? validateSenha(value) {
  if (isNull(value) || value.isEmpty)
    return 'Senha precisa ser preenchida';
  else if (value.length < 6)
    return 'Mínimo 6 caracteres';
  else
    return null;
}
