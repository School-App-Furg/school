import 'dart:convert';

class UserModel {
  String name;
  int tipo;
  String cnpj;
  UserModel({
    required this.cnpj,
    required this.name,
    required this.tipo,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'tipo': tipo,
      'cnpj': cnpj,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      tipo: map['tipo'],
      cnpj: map['cnpj'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
