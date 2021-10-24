import 'dart:convert';

class SchoolRegister {
  String schoolName;
  String city;
  String email;
  int cnpj;
  SchoolRegister({
    required this.schoolName,
    required this.city,
    required this.email,
    required this.cnpj,
  });

  Map<String, dynamic> toMap() {
    return {
      'Nome da Escola': schoolName,
      'Cidade': city,
      'E-mail': email,
      'Cnpj': cnpj,
    };
  }

  factory SchoolRegister.fromMap(Map<String, dynamic> map) {
    return SchoolRegister(
      schoolName: map['Nome da Escola'],
      city: map['Cidade'],
      email: map['E-mail'],
      cnpj: map['Cnpj'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SchoolRegister.fromJson(String source) =>
      SchoolRegister.fromMap(json.decode(source));
}
