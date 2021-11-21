import 'dart:convert';

class Cycle {
  String name;
  String idSchool;
  DateTime initialDate;
  DateTime finalDate;
  Cycle({
    required this.name,
    required this.idSchool,
    required this.initialDate,
    required this.finalDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'idSchool': idSchool,
      'initialDate': initialDate.millisecondsSinceEpoch,
      'finalDate': finalDate.millisecondsSinceEpoch,
    };
  }

  factory Cycle.fromMap(Map<String, dynamic> map) {
    return Cycle(
      name: map['name'],
      idSchool: map['idSchool'],
      initialDate: DateTime.fromMillisecondsSinceEpoch(map['initialDate']),
      finalDate: DateTime.fromMillisecondsSinceEpoch(map['finalDate']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Cycle.fromJson(String source) => Cycle.fromMap(json.decode(source));
}
