import 'dart:convert';

class SchoolModel {
  String? id;
  String currentCycle;
  String cnpj;
  DateTime closingDate;
  String logo;
  String name;
  int regime;
  SchoolModel({
    this.id,
    required this.currentCycle,
    required this.cnpj,
    required this.closingDate,
    required this.logo,
    required this.name,
    required this.regime,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'currentCycle': currentCycle,
      'cnpj': cnpj,
      'closingDate': closingDate.millisecondsSinceEpoch,
      'logo': logo,
      'name': name,
      'regime': regime,
    };
  }

  factory SchoolModel.fromMap(Map<String, dynamic> map) {
    return SchoolModel(
      id: map['id'],
      currentCycle: map['currentCycle'] ?? '',
      cnpj: map['cnpj'] ?? '',
      closingDate: DateTime.fromMillisecondsSinceEpoch(map['closingDate']),
      logo: map['logo'] ?? '',
      name: map['name'] ?? '',
      regime: map['regime']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory SchoolModel.fromJson(String source) =>
      SchoolModel.fromMap(json.decode(source));
}
