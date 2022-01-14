import 'dart:convert';

class Classes {
  String? id;
  String schoolId;
  String name;
  String room;
  String cycleId;
  String level;
  List<String>? students;
  Classes({
    this.id,
    required this.schoolId,
    required this.name,
    required this.room,
    required this.cycleId,
    required this.level,
    this.students,
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
    );
  }

  String toJson() => json.encode(toMap());

  factory Classes.fromJson(String source) =>
      Classes.fromMap(json.decode(source));
}
