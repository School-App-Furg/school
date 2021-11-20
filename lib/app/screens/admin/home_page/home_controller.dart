import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:school/app/screens/repository/auth_repository.dart';
import 'package:school/app/screens/repository/user_repository.dart';
import 'model/classrooms.dart';
import 'model/user_model.dart';
part '../home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  //Solicita as informações do usuário ao firebase
  @observable
  late UserModel? userModel;

  getUserInformations() async {
    String id = Modular.get<AuthRepository>().usuario!.uid;
    userModel = await Modular.get<UsersRepository>().getAdminById(id);
  }

  List<ClassRooms> classRoomList = [
    ClassRooms(
      anoTurma: "5º" + " Ano",
      sala: "Sala " + "01",
      turmas: "Turma(s) " + "A e B",
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
