import 'dart:convert';

class SubjectTeacher {
  String? id;
  String subject;
  String teacher;
  SubjectTeacher({
    this.id,
    required this.subject,
    required this.teacher,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'subject': subject,
      'teacher': teacher,
    };
  }

  factory SubjectTeacher.fromMap(Map<String, dynamic> map) {
    return SubjectTeacher(
      id: map['id'] != null ? map['id'] : null,
      subject: map['subject'],
      teacher: map['teacher'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SubjectTeacher.fromJson(String source) =>
      SubjectTeacher.fromMap(json.decode(source));
}
