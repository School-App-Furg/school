import 'dart:convert';

class InsertSubjectTeacher {
  String idTeacher;
  String idSubject;
  InsertSubjectTeacher({
    required this.idTeacher,
    required this.idSubject,
  });

  Map<String, dynamic> toMap() {
    return {
      'idTeacher': idTeacher,
      'idSubject': idSubject,
    };
  }

  factory InsertSubjectTeacher.fromMap(Map<String, dynamic> map) {
    return InsertSubjectTeacher(
      idTeacher: map['idTeacher'],
      idSubject: map['idSubject'],
    );
  }

  String toJson() => json.encode(toMap());

  factory InsertSubjectTeacher.fromJson(String source) =>
      InsertSubjectTeacher.fromMap(json.decode(source));
}
