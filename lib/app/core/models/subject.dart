import 'dart:convert';

class Subject {
  String name;
  String schoolId;
  Subject({
    required this.name,
    required this.schoolId,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'schoolId': schoolId,
    };
  }

  factory Subject.fromMap(Map<String, dynamic> map) {
    return Subject(
      name: map['name'],
      schoolId: map['schoolId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Subject.fromJson(String source) =>
      Subject.fromMap(json.decode(source));
}
