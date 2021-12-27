import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:school/app/core/models/classes.dart';
import 'package:school/app/core/models/school_model.dart';
import 'package:school/app/core/models/teacher_user.dart';
import 'package:school/app/core/models/user_admin.dart';
import 'package:school/app/resources/auth_repository.dart';
import 'package:school/app/screens/admin/admin_service.dart';

import 'model/classrooms.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  AdminService adminService = AdminService();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  User? user = Modular.get<AuthRepository>().usuario;

  @observable
  SchoolModel? schoolModel = SchoolModel(
      currentCycle: "",
      cnpj: "",
      closingDate: DateTime.now(),
      logo: '',
      name: '',
      regime: 0);

  @observable
  TeacherUser? teacherUser = TeacherUser(
    name: '',
    schoolId: '',
    type: 2,
  );

  @observable
  bool loading = false;

  //Solicita as informações da escola ao firebase
  @action
  Future initHome() async {
    loading = true;
    teacherUser = await adminService.getUserTeacherById(user!.uid);
    schoolModel =
        await adminService.getSchoolInformations(teacherUser!.schoolId);
    classes = await adminService.getClasses(
        teacherUser!.schoolId, schoolModel!.currentCycle);
    loading = false;
  }

  //lista de turmas
  @observable
  ObservableList<Classes>? classes = ObservableList<Classes>();

  //lista de imagens banner
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
