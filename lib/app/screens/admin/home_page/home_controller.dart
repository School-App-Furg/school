import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/components/loader/loader_default.dart';
import '../../../core/models/classes.dart';
import '../../../core/models/school_model.dart';
import '../../../core/models/user_admin.dart';
import '../../../core/service/snackbars.dart';
import '../../../resources/auth_repository.dart';
import '../admin_service.dart';

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
    name: '',
  );

  late UserAdmin? userAdmin;

  @observable
  bool loading = false;

  //Solicita as informações da escola ao firebase
  @action
  Future initHome() async {
    loading = true;
    userAdmin = await adminService.getUserAdminById(user!.uid);
    schoolModel = await adminService.getSchoolInformations(userAdmin!.schoolId);
    classes = await adminService.getClasses(
        userAdmin!.schoolId, schoolModel!.currentCycle);
    await setSubjectTeacher(classes!);
    loading = false;
  }

  @action
  setSubjectTeacher(List<Classes> classes) async {
    classes.forEach(
      (element) async {
        element.subjectTeachers =
            await adminService.getSubjectTeacher(element.id);
      },
    );
  }

  //lista de turmas
  @observable
  List<Classes>? classes = [];

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

  deleteClass(BuildContext context, Classes classes) async {
    final loader = LoaderDefault();
    try {
      loader.show();
      classes.subjectTeachers!.forEach((element) async {
        await adminService.deleteSubjectTeacher(element, classes.id!);
      });
      bool deleted = await adminService.deleteClass(classes.id!);
      if (deleted) {
        adminService.updateHome();
        loader.hide();
        buildSnackBarUi(context, "Turma excluida com sucesso!");
      } else {
        loader.hide();
        buildSnackBarUi(context, "A turma não foi excluida corretamente!");
      }
    } catch (e) {
      loader.hide();
      buildSnackBarUi(context, e.toString());
    }
  }
}
