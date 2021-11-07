import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClassRooms {
  String disciplina;
  String descricao;
  String professor;
  NetworkImage bannerImg;
  Color uiColor = Colors.red;
  List<double> clrs = [];

  ClassRooms({
    required this.disciplina,
    required this.descricao,
    required this.professor,
    required this.bannerImg,
    required this.clrs,
  });
}

List<ClassRooms> classRoomList = [
  ClassRooms(
    disciplina: "Biologia",
    descricao: "second year",
    professor: "Alice",
    bannerImg: NetworkImage(
        "https://www.gstatic.com/classroom/themes/img_breakfast.jpg"),
    clrs: [255, 233, 116, 57],
  ),
  ClassRooms(
    disciplina: "Inglês",
    descricao: "second year",
    professor: "Peter Parker",
    bannerImg: NetworkImage(
        "https://www.gstatic.com/classroom/themes/img_bookclub.jpg"),
    clrs: [255, 101, 237, 153],
  ),
  ClassRooms(
    disciplina: "História",
    descricao: "second year",
    professor: "Felipe",
    bannerImg:
        NetworkImage("https://www.gstatic.com/classroom/themes/Honors.jpg"),
    clrs: [255, 111, 27, 198],
  ),
  ClassRooms(
      disciplina: "Matemática",
      descricao: "first year",
      professor: "Karina",
      bannerImg: NetworkImage(
          "https://www.gstatic.com/classroom/themes/img_learnlanguage.jpg"),
      clrs: [255, 0, 0, 0]),
  ClassRooms(
      disciplina: "Geografia",
      descricao: "first year",
      professor: "Leonel",
      bannerImg:
          NetworkImage("https://www.gstatic.com/classroom/themes/img_code.jpg"),
      clrs: [255, 102, 153, 204]),
  ClassRooms(
    disciplina: "Química",
    descricao: "first year",
    professor: "Thor",
    bannerImg:
        NetworkImage("https://www.gstatic.com/classroom/themes/Chemistry.jpg"),
    clrs: [255, 111, 27, 198],
  ),
];
