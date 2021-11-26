import 'dart:convert';

class TeacherUser {
  String schoolid;
  String name;
  int type;

  TeacherUser({
    required this.schoolid,
    required this.name,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'schoolid': schoolid,
      'name': name,
      'type': type,
    };
  }

  factory TeacherUser.fromMap(Map<String, dynamic> map) {
    return TeacherUser(
      schoolid: map['schoolid'],
      name: map['name'],
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TeacherUser.fromJson(String source) =>
      TeacherUser.fromMap(json.decode(source));
}
