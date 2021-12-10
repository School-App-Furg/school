import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:school/app/core/models/subject_list.dart';
part 'subjects_list_controller.g.dart';

class SubjectsListController = _SubjectsListControllerBase
    with _$SubjectsListController;

abstract class _SubjectsListControllerBase with Store {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<SubjectList> classRoomList = [
    SubjectList(
      name: 'Inglês',
      teacher: "Pedro",
    ),
    SubjectList(
      name: "Física",
      teacher: "Joselso",
    ),
    SubjectList(
      name: "Química",
      teacher: "Mirian",
    ),
    SubjectList(
      name: "Geografia",
      teacher: "Laura",
    ),
    SubjectList(
      name: "Matemática",
      teacher: "Chris",
    ),
  ];

  //Lista de imagens das disciplinas
  List banners = [
    "assets/banners/0.jpeg",
    "assets/banners/1.jpeg",
    "assets/banners/2.jpeg",
    "assets/banners/3.jpg",
    "assets/banners/4.jpg"
  ];

  //funcao para alocar a sequencia de imagens banner
  definiBanner(int index) {
    var resto = index % 5;
    if (index < 5) {
      return banners[index];
    } else {
      if (resto == 0) {
        return banners[0];
      } else if (resto == 1) {
        return banners[1];
      } else if (resto == 2) {
        return banners[2];
      } else if (resto == 3) {
        return banners[3];
      } else if (resto == 4) {
        return banners[4];
      }
    }
  }
}
