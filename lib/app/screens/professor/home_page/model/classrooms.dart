import 'package:flutter/material.dart';

class ClassRooms {
  String anoTurma;
  String sala;
  String turmas;
  NetworkImage bannerImg;
  Color uiColor = Colors.red;
  List<double> clrs = [];

  ClassRooms({
    required this.anoTurma,
    required this.sala,
    required this.turmas,
    required this.bannerImg,
    required this.clrs,
  });
}
