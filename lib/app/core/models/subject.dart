import 'dart:convert';

class Subject {
  String? id;
  String name;
  String schoolId;
  Subject({
    this.id,
    required this.name,
    required this.schoolId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'schoolId': schoolId,
    };
  }

  factory Subject.fromMap(Map<String, dynamic> map) {
    return Subject(
      id: map['id'],
      name: map['name'] ?? '',
      schoolId: map['schoolId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Subject.fromJson(String source) =>
      Subject.fromMap(json.decode(source));
}
