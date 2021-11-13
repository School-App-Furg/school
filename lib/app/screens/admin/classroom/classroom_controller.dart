import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../home_page/model/classrooms.dart';
import '../home_page/model/classworks.dart';
import '../home_page/model/comments.dart';

part 'classroom_controller.g.dart';

class ClassroomController = _ClassroomControllerBase with _$ClassroomController;

abstract class _ClassroomControllerBase with Store {
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
        bannerImg: NetworkImage(
            "https://www.gstatic.com/classroom/themes/img_code.jpg"),
        clrs: [255, 102, 153, 204]),
    ClassRooms(
      disciplina: "Química",
      descricao: "first year",
      professor: "Thor",
      bannerImg: NetworkImage(
          "https://www.gstatic.com/classroom/themes/Chemistry.jpg"),
      clrs: [255, 111, 27, 198],
    ),
  ];

  List<Comments> commentList = [
    Comments(
        userName: "Maria", date: "02/01/21", comment: "Aula no laboratório"),
    Comments(userName: "Pedro", date: "02/01/21", comment: "Aula top"),
    Comments(userName: "Bro Cat", date: "02/01/21", comment: "Aula top"),
    Comments(userName: "Michael Cat", date: "02/01/21", comment: "Aula top"),
    Comments(userName: "Wild Cat", date: "02/01/21", comment: "Aula top"),
    Comments(userName: "Kit Cat", date: "02/01/21", comment: "Aula top"),
    Comments(userName: "Copy Cat", date: "02/01/21", comment: "Aula top"),
    Comments(userName: "Kitty Cat", date: "02/01/21", comment: "Aula top"),
  ];

  List<ClassWorks> classWorkList = [
    ClassWorks(topic: "Avaliação 1", dateTime: "01/01/21"),
    ClassWorks(topic: "Avaliação 2", dateTime: "01/01/21"),
    ClassWorks(topic: "Avaliação 3", dateTime: "01/01/21"),
    ClassWorks(topic: "Avaliação 4", dateTime: "01/01/21"),
    ClassWorks(topic: "Avaliação 5", dateTime: "01/01/21"),
    ClassWorks(topic: "Avaliação 6", dateTime: "01/01/21"),
  ];
}
