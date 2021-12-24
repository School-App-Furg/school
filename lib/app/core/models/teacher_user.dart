import 'dart:convert';

class TeacherUser {
  String? id;
  String schoolId;
  String name;
  int type;
  List<String>? subjects;
  TeacherUser({
    this.id,
    required this.schoolId,
    required this.name,
    required this.type,
    this.subjects,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'schoolId': schoolId,
      'name': name,
      'type': type,
      'subjects': subjects,
    };
  }

  factory TeacherUser.fromMap(Map<String, dynamic> map) {
    return TeacherUser(
      id: map['id'],
      schoolId: map['schoolId'] ?? '',
      name: map['name'] ?? '',
      type: map['type']?.toInt() ?? 0,
      subjects: List<String>.from(map['subjects']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TeacherUser.fromJson(String source) =>
      TeacherUser.fromMap(json.decode(source));
}
