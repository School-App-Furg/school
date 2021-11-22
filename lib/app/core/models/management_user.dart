import 'dart:convert';

class ManagementUser {
  String schoolid;
  String name;
  int type;
  ManagementUser({
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

  factory ManagementUser.fromMap(Map<String, dynamic> map) {
    return ManagementUser(
      schoolid: map['school_id'],
      name: map['name'],
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ManagementUser.fromJson(String source) =>
      ManagementUser.fromMap(json.decode(source));
}
