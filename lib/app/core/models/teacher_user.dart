import 'dart:convert';

class TeacherUser {
  String? id;
  String schoolId;
  String name;
  int type;
  TeacherUser({
    this.id,
    required this.schoolId,
    required this.name,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'schoolId': schoolId,
      'name': name,
      'type': type,
    };
  }

  factory TeacherUser.fromMap(Map<String, dynamic> map) {
    return TeacherUser(
      id: map['id'] != null ? map['id'] : null,
      schoolId: map['schoolId'],
      name: map['name'],
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TeacherUser.fromJson(String source) =>
      TeacherUser.fromMap(json.decode(source));
}
