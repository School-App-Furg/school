import 'dart:convert';

class SubjectTeacher {
  String? id;
  String? idSubject;
  String subject;
  String? idTeacher;
  String teacher;
  SubjectTeacher({
    this.id,
    this.idSubject,
    required this.subject,
    this.idTeacher,
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
      id: map['id'] != null ? map['id'] : null,
      idSubject: map['idSubject'] != null ? map['idSubject'] : null,
      subject: map['subject'],
      idTeacher: map['idTeacher'] != null ? map['idTeacher'] : null,
      teacher: map['teacher'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SubjectTeacher.fromJson(String source) =>
      SubjectTeacher.fromMap(json.decode(source));
}
