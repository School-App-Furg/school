import 'dart:convert';

class Classes {
  String schoolId;
  String name;
  String room;
  String cycleId;
  String level;
  List<String>? students;
  Classes({
    required this.schoolId,
    required this.name,
    required this.room,
    required this.cycleId,
    required this.level,
    this.students,
  });

  Map<String, dynamic> toMap() {
    return {
      'schoolId': schoolId,
      'name': name,
      'room': room,
      'cycleId': cycleId,
      'level': level,
      'students': students,
    };
  }

  factory Classes.fromMap(Map<String, dynamic> map) {
    return Classes(
      schoolId: map['schoolId'],
      name: map['name'],
      room: map['room'],
      cycleId: map['cycleId'],
      level: map['level'],
      students:
          map['students'] != null ? List<String>.from(map['students']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Classes.fromJson(String source) =>
      Classes.fromMap(json.decode(source));
}
