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
