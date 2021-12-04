import 'dart:convert';

import 'subject_teacher.dart';

class Classes {
  String schoolId;
  String name;
  String room;
  String cycleId;
  String level;
  List<SubjectTeacher>? subjectTeacher;
  Classes({
    required this.schoolId,
    required this.name,
    required this.room,
    required this.cycleId,
    required this.level,
    this.subjectTeacher,
  });

  Map<String, dynamic> toMap() {
    return {
      'schoolId': schoolId,
      'name': name,
      'room': room,
      'cycleId': cycleId,
      'level': level,
      'subjectTeacher': subjectTeacher?.map((x) => x.toMap()).toList(),
    };
  }

  factory Classes.fromMap(Map<String, dynamic> map) {
    return Classes(
      schoolId: map['schoolId'],
      name: map['name'],
      room: map['room'],
      cycleId: map['cycleId'],
      level: map['level'],
      subjectTeacher: map['subjectTeacher'] != null
          ? List<SubjectTeacher>.from(
              map['subjectTeacher']?.map((x) => SubjectTeacher.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Classes.fromJson(String source) =>
      Classes.fromMap(json.decode(source));
}
