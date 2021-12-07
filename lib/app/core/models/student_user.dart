import 'dart:convert';

class StudentUser {
  String? id;
  String schoolId;
  String name;
  int type;
  StudentUser({
    this.id,
    required this.schoolId,
    required this.name,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'schoolId': schoolId,
      'name': name,
      'type': type,
    };
  }

  factory StudentUser.fromMap(Map<String, dynamic> map) {
    return StudentUser(
      id: map['id'] != null ? map['id'] : null,
      schoolId: map['schoolId'],
      name: map['name'],
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentUser.fromJson(String source) =>
      StudentUser.fromMap(json.decode(source));
}
