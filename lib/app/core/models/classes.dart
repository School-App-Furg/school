import 'dart:convert';

import 'subject_teacher.dart';

class Classes {
  String? id;
  String schoolId;
  String name;
  String room;
  String cycleId;
  String level;
  List<String>? students;
  List<SubjectTeacher>? subjectTeachers;
  Classes({
    this.id,
    required this.schoolId,
    required this.name,
    required this.room,
    required this.cycleId,
    required this.level,
    this.students,
    this.subjectTeachers,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'schoolId': schoolId,
      'name': name,
      'room': room,
      'cycleId': cycleId,
      'level': level,
      'students': students,
      'subjectTeachers': subjectTeachers?.map((x) => x.toMap()).toList(),
    };
  }

  factory Classes.fromMap(Map<String, dynamic> map) {
    return Classes(
      id: map['id'],
      schoolId: map['schoolId'] ?? '',
      name: map['name'] ?? '',
      room: map['room'] ?? '',
      cycleId: map['cycleId'] ?? '',
      level: map['level'] ?? '',
      students: List<String>.from(map['students']),
      subjectTeachers: map['subjectTeachers'] != null
          ? List<SubjectTeacher>.from(
              map['subjectTeachers']?.map((x) => SubjectTeacher.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Classes.fromJson(String source) =>
      Classes.fromMap(json.decode(source));
}
