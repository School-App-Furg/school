import 'dart:convert';

class Subject {
  String? id;
  String name;
  String schoolId;
  List<String>? teachers;
  Subject({
    this.id,
    required this.name,
    required this.schoolId,
    this.teachers,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'schoolId': schoolId,
      'teachers': teachers,
    };
  }

  factory Subject.fromMap(Map<String, dynamic> map) {
    return Subject(
      id: map['id'] != null ? map['id'] : null,
      name: map['name'],
      schoolId: map['schoolId'],
      teachers:
          map['teachers'] != null ? List<String>.from(map['teachers']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Subject.fromJson(String source) =>
      Subject.fromMap(json.decode(source));
}
