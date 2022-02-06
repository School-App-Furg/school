import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/models/cycle.dart';
import '../../../core/models/school_model.dart';
import '../../../core/models/student_user.dart';
import '../../../core/models/subject_teacher.dart';
import '../../../resources/auth_repository.dart';
import '../aluno_service.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  AlunoService alunoService = AlunoService();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  //pega as informações do user logado através da injeção de dependencia
  User? user = Modular.get<AuthRepository>().usuario;

  //lista de disciplinas e seus respectivos professores
  @observable
  List<SubjectTeacher> subjects = [];

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

  //Classe sendo inicializada
  @observable
  StudentUser? userStudent =
      StudentUser(schoolId: '', name: '', cpf: '', type: 2);

  //bool para carregamento dos dados
  @observable
  bool loading = false;

  //Solicita as informações do aluno ao firebase
  @action
  Future initHome() async {
    loading = true;
    if (actualyCycle!.name == '') {
      userStudent = await alunoService.getUserStudentById(user!.uid);
      schoolModel =
          await alunoService.getSchoolInformations(userStudent!.schoolId);
      actualyCycle =
          await alunoService.getCurrentCycle(schoolModel!.currentCycle);
    }
    subjects = await alunoService.getSubjectsForStudent(
        schoolModel!.id!, actualyCycle!.id!, userStudent!.id!);
    loading = false;
  }

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
