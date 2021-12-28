import 'dart:convert';

class StudentUser {
  String? id;
  String schoolId;
  String name;
  String cpf;
  int type;
  StudentUser({
    this.id,
    required this.schoolId,
    required this.name,
    required this.cpf,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'schoolId': schoolId,
      'name': name,
      'cpf': cpf,
      'type': type,
    };
  }

  factory StudentUser.fromMap(Map<String, dynamic> map) {
    return StudentUser(
      id: map['id'],
      schoolId: map['schoolId'] ?? '',
      name: map['name'] ?? '',
      cpf: map['cpf'] ?? '',
      type: map['type']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentUser.fromJson(String source) =>
      StudentUser.fromMap(json.decode(source));
}
