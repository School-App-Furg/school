import 'dart:convert';

class UserAdmin {
  String schoolId;
  String name;
  int type;
  UserAdmin({
    required this.schoolId,
    required this.name,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'schoolId': schoolId,
      'name': name,
      'type': type,
    };
  }

  factory UserAdmin.fromMap(Map<String, dynamic> map) {
    return UserAdmin(
      schoolId: map['schoolId'],
      name: map['name'],
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAdmin.fromJson(String source) =>
      UserAdmin.fromMap(json.decode(source));
}
