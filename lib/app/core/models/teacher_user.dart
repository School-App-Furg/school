import 'dart:convert';

class TeacherUser {
  String schoolid;
  String name;
  int type;
  List classes;
  List subjects;
  TeacherUser({
    required this.schoolid,
    required this.name,
    required this.type,
    required this.classes,
    required this.subjects,
  });

  Map<String, dynamic> toMap() {
    return {
      'schoolid': schoolid,
      'name': name,
      'type': type,
      'classes': classes,
      'subjects': subjects,
    };
  }

  factory TeacherUser.fromMap(Map<String, dynamic> map) {
    return TeacherUser(
      schoolid: map['schoolid'],
      name: map['name'],
      type: map['type'],
      classes: List.from(map['classes']),
      subjects: List.from(map['subjects']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TeacherUser.fromJson(String source) =>
      TeacherUser.fromMap(json.decode(source));
}
