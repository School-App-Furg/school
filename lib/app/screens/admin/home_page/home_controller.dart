import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';
import 'package:school/app/core/models/classes.dart';
import '../../../core/models/school_model.dart';

import '../admin_service.dart';

import 'model/classrooms.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  AdminService adminService = AdminService();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @observable
  SchoolModel? schoolModel = SchoolModel(
      currentCycle: 0,
      cnpj: '',
      closingDate: DateTime.now(),
      logo: '',
      name: '',
      regime: 0);

  @observable
  bool loading = false;

  //Solicita as informações da escola ao firebase
  @action
  Future initHome() async {
    loading = true;
    schoolModel = await adminService.getSchoolInformations();
    //classes = await adminService.getClasses();
    loading = false;
  }

  @observable
  late List<Classes>? classes;

  List<ClassRooms> classRoomList = [
    ClassRooms(
      anoTurma: "5º" + " Ano",
      sala: "Sala " + "01",
      turmas: "Turma" + "A ",
      bannerImg:
          NetworkImage("https://gstatic.com/classroom/themes/USHistory.jpg"),
      clrs: [255, 233, 116, 57],
    ),
    ClassRooms(
      anoTurma: "6º" + " Ano",
      sala: "Sala " + "02",
      turmas: "Turma(s) " + "A e B",
      bannerImg: NetworkImage(
          "https://gstatic.com/classroom/themes/img_backtoschool.jpg"),
      clrs: [255, 101, 237, 153],
    ),
    ClassRooms(
      anoTurma: "6º" + " Ano",
      sala: "Sala " + "03",
      turmas: "Turma(s) " + "A e B",
      bannerImg:
          NetworkImage("https://gstatic.com/classroom/themes/Honors.jpg"),
      clrs: [255, 111, 27, 198],
    ),
    ClassRooms(
        anoTurma: "7º" + " Ano",
        sala: "Sala " + "04",
        turmas: "Turma(s) " + "A e B",
        bannerImg: NetworkImage(
            "https://gstatic.com/classroom/themes/WorldStudies.jpg"),
        clrs: [255, 0, 0, 0]),
    ClassRooms(
        anoTurma: "8º" + " Ano",
        sala: "Sala " + "05",
        turmas: "Turma(s) " + "A e B",
        bannerImg:
            NetworkImage("https://gstatic.com/classroom/themes/Biology.jpg"),
        clrs: [255, 102, 153, 204]),
  ];
}
