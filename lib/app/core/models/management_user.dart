import 'dart:convert';

class ManagementUser {
  String schoolId;
  String name;
  int type;
  ManagementUser({
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

  factory ManagementUser.fromMap(Map<String, dynamic> map) {
    return ManagementUser(
      schoolId: map['schoolId'],
      name: map['name'],
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ManagementUser.fromJson(String source) =>
      ManagementUser.fromMap(json.decode(source));
}
