import 'dart:convert';

class StudentUser {
  String schoolid;
  String name;
  int type;
  String currentClass;
  List oldClasses;
  StudentUser({
    required this.schoolid,
    required this.name,
    required this.type,
    required this.currentClass,
    required this.oldClasses,
  });

  Map<String, dynamic> toMap() {
    return {
      'schoolid': schoolid,
      'name': name,
      'type': type,
      'currentClass': currentClass,
      'oldClasses': oldClasses,
    };
  }

  factory StudentUser.fromMap(Map<String, dynamic> map) {
    return StudentUser(
      schoolid: map['schoolid'],
      name: map['name'],
      type: map['type'],
      currentClass: map['currentClass'],
      oldClasses: List.from(map['oldClasses']),
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentUser.fromJson(String source) =>
      StudentUser.fromMap(json.decode(source));
}
