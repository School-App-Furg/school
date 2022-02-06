import 'dart:convert';

class SubjectTeacher {
  String? id;
  String idSubject;
  String subject;
  String idTeacher;
  String teacher;
  SubjectTeacher({
    this.id,
    required this.idSubject,
    required this.subject,
    required this.idTeacher,
    required this.teacher,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idSubject': idSubject,
      'subject': subject,
      'idTeacher': idTeacher,
      'teacher': teacher,
    };
  }

  factory SubjectTeacher.fromMap(Map<String, dynamic> map) {
    return SubjectTeacher(
      id: map['id'],
      idSubject: map['idSubject'] ?? '',
      subject: map['subject'] ?? '',
      idTeacher: map['idTeacher'] ?? '',
      teacher: map['teacher'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SubjectTeacher.fromJson(String source) =>
      SubjectTeacher.fromMap(json.decode(source));
}
