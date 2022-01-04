import 'dart:convert';

class Cycle {
  String name;
  String idSchool;
  String approvalAttendance;
  String approvalPattern;
  String evaluationStandard;
  int initialDate;
  int finalDate;
  Cycle({
    required this.name,
    required this.idSchool,
    required this.approvalAttendance,
    required this.approvalPattern,
    required this.evaluationStandard,
    required this.initialDate,
    required this.finalDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'idSchool': idSchool,
      'approvalAttendance': approvalAttendance,
      'approvalPattern': approvalPattern,
      'evaluationStandard': evaluationStandard,
      'initialDate': initialDate,
      'finalDate': finalDate,
    };
  }

  factory Cycle.fromMap(Map<String, dynamic> map) {
    return Cycle(
      name: map['name'] ?? '',
      idSchool: map['idSchool'] ?? '',
      approvalAttendance: map['approvalAttendance'] ?? '',
      approvalPattern: map['approvalPattern'] ?? '',
      evaluationStandard: map['evaluationStandard'] ?? '',
      initialDate: map['initialDate']?.toInt() ?? 0,
      finalDate: map['finalDate']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cycle.fromJson(String source) => Cycle.fromMap(json.decode(source));
}
