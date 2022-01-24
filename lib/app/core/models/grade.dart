import 'dart:convert';

class Grade {
  String? id;
  String student;
  String cycle;
  num date;
  String subject;
  num note;
  num timeCourse;
  int faults;
  String teacher;
  String classe;
  String school;
  Grade({
    this.id,
    required this.student,
    required this.cycle,
    required this.date,
    required this.subject,
    required this.note,
    required this.timeCourse,
    required this.faults,
    required this.teacher,
    required this.classe,
    required this.school,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'student': student,
      'cycle': cycle,
      'date': date,
      'subject': subject,
      'note': note,
      'timeCourse': timeCourse,
      'faults': faults,
      'teacher': teacher,
      'classe': classe,
      'school': school,
    };
  }

  factory Grade.fromMap(Map<String, dynamic> map) {
    return Grade(
      id: map['id'],
      student: map['student'] ?? '',
      cycle: map['cycle'] ?? '',
      date: map['date'] ?? 0,
      subject: map['subject'] ?? '',
      note: map['note'] ?? 0,
      timeCourse: map['timeCourse'] ?? 0,
      faults: map['faults']?.toInt() ?? 0,
      teacher: map['teacher'] ?? '',
      classe: map['classe'] ?? '',
      school: map['school'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Grade.fromJson(String source) => Grade.fromMap(json.decode(source));
}
