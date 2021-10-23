import 'dart:convert';

class Aluno {
  String name;
  int nota;
  Aluno({
    required this.name,
    required this.nota,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'nota': nota,
    };
  }

  factory Aluno.fromMap(Map<String, dynamic> map) {
    return Aluno(
      name: map['name'],
      nota: map['nota'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Aluno.fromJson(String source) => Aluno.fromMap(json.decode(source));
}
