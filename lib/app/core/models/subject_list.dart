import 'dart:convert';

class SubjectList {
  String name;
  String teacher;
  SubjectList({
    required this.name,
    required this.teacher,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'teacher': teacher,
    };
  }

  factory SubjectList.fromMap(Map<String, dynamic> map) {
    return SubjectList(
      name: map['name'],
      teacher: map['teacher'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SubjectList.fromJson(String source) =>
      SubjectList.fromMap(json.decode(source));
}
