import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../../core/models/cycle.dart';

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

  //Classe sendo inicializada
  @observable
  Cycle? actualyCycle = Cycle(
      name: "",
      idSchool: "",
      approvalPattern: "",
      evaluationStandard: "",
      initialDate: 0,
      finalDate: 0);

  //Classe sendo inicializada
  @observable
  SchoolModel? schoolModel = SchoolModel(
    currentCycle: "",
    cnpj: "",
    name: '',
  );

  late UserAdmin? userAdmin;

  //bool para carregamento dos dados
  @observable
  bool loading = false;

  //Solicita as informações da escola ao firebase
  @action
  Future initHome() async {
    loading = true;
    if (actualyCycle!.name == '') {
      userAdmin = await adminService.getUserAdminById(user!.uid);
      schoolModel =
          await adminService.getSchoolInformations(userAdmin!.schoolId);
      actualyCycle =
          await adminService.getCurrentCycle(schoolModel!.currentCycle);
    }
    classes =
        await adminService.getClasses(userAdmin!.schoolId, actualyCycle!.id!);
    await setSubjectTeacher(classes!);
    loading = false;
  }

  //Define o professor associado à turma
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

  //função para alocar a sequência de imagens banner
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

  //Exclui a turma selecionada
  deleteClass(BuildContext context, Classes classes) async {
    final loader = LoaderDefault();
    try {
      loader.show();
      classes.subjectTeachers!.forEach((element) async {
        await adminService.deleteSubjectTeacher(element, classes.id!);
      });
      bool deleted = await adminService.deleteClass(classes.id!);
      Navigator.of(context).pop();
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
