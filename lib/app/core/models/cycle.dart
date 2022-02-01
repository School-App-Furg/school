import 'dart:convert';

class Cycle {
  String? id;
  String name;
  String idSchool;
  String approvalPattern;
  String evaluationStandard;
  int initialDate;
  int finalDate;
  Cycle({
    this.id,
    required this.name,
    required this.idSchool,
    required this.approvalPattern,
    required this.evaluationStandard,
    required this.initialDate,
    required this.finalDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'idSchool': idSchool,
      'approvalPattern': approvalPattern,
      'evaluationStandard': evaluationStandard,
      'initialDate': initialDate,
      'finalDate': finalDate,
    };
  }

  factory Cycle.fromMap(Map<String, dynamic> map) {
    return Cycle(
      id: map['id'],
      name: map['name'] ?? '',
      idSchool: map['idSchool'] ?? '',
      approvalPattern: map['approvalPattern'] ?? '',
      evaluationStandard: map['evaluationStandard'] ?? '',
      initialDate: map['initialDate']?.toInt() ?? 0,
      finalDate: map['finalDate']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cycle.fromJson(String source) => Cycle.fromMap(json.decode(source));
}
