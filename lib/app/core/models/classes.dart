import 'dart:convert';

class Classes {
  String schoolId;
  String name;
  String room;
  String cycleId;
  String level;
  List<String> idStudents;
  List<String> idSubjects;
  Classes({
    required this.schoolId,
    required this.name,
    required this.room,
    required this.cycleId,
    required this.level,
    required this.idStudents,
    required this.idSubjects,
  });

  Map<String, dynamic> toMap() {
    return {
      'schoolId': schoolId,
      'name': name,
      'room': room,
      'cycleId': cycleId,
      'level': level,
      'idStudents': idStudents,
      'idSubjects': idSubjects,
    };
  }

  factory Classes.fromMap(Map<String, dynamic> map) {
    return Classes(
      schoolId: map['schoolId'],
      name: map['name'],
      room: map['room'],
      cycleId: map['cycleId'],
      level: map['level'],
      idStudents: List<String>.from(map['idStudents']),
      idSubjects: List<String>.from(map['idSubjects']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Classes.fromJson(String source) =>
      Classes.fromMap(json.decode(source));
}
