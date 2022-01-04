import 'dart:convert';

class SchoolModel {
  String? id;
  String currentCycle;
  String cnpj;
  String name;
  SchoolModel({
    this.id,
    required this.currentCycle,
    required this.cnpj,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'currentCycle': currentCycle,
      'cnpj': cnpj,
      'name': name,
    };
  }

  factory SchoolModel.fromMap(Map<String, dynamic> map) {
    return SchoolModel(
      id: map['id'],
      currentCycle: map['currentCycle'] ?? '',
      cnpj: map['cnpj'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SchoolModel.fromJson(String source) =>
      SchoolModel.fromMap(json.decode(source));
}
