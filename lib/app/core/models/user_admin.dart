import 'dart:convert';

class UserAdmin {
  String schoolid;
  String name;
  int type;
  UserAdmin({
    required this.schoolid,
    required this.name,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'school_id': schoolid,
      'name': name,
      'type': type,
    };
  }

  factory UserAdmin.fromMap(Map<String, dynamic> map) {
    return UserAdmin(
      schoolid: map['school_id'],
      name: map['name'],
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAdmin.fromJson(String source) =>
      UserAdmin.fromMap(json.decode(source));
}
