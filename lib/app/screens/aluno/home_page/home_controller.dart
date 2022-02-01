import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/models/subject_teacher.dart';
import '../aluno_service.dart';

import '../../../core/models/school_model.dart';
import '../../../core/models/student_user.dart';

import '../../../resources/auth_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  AlunoService alunoService = AlunoService();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  User? user = Modular.get<AuthRepository>().usuario;

  @observable
  String actualyCycle = '';

  @observable
  SchoolModel? schoolModel = SchoolModel(
    currentCycle: "",
    cnpj: "",
    name: '',
  );

  @observable
  StudentUser? userStudent =
      StudentUser(schoolId: '', name: '', cpf: '', type: 2);

  @observable
  bool loading = false;

  //Solicita as informações do aluno ao firebase
  @action
  Future initHome() async {
    loading = true;
    if (actualyCycle == '') {
      userStudent = await alunoService.getUserStudentById(user!.uid);
      schoolModel =
          await alunoService.getSchoolInformations(userStudent!.schoolId);
      actualyCycle = schoolModel!.currentCycle;
    }
    subjects = await alunoService.getSubjectsForStudent(
        schoolModel!.id!, actualyCycle, userStudent!.id!);
    loading = false;
  }

  //lista de disciplinas
  @observable
  List<SubjectTeacher> subjects = [];

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
