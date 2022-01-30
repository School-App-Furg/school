import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/models/classes.dart';
import '../../../core/models/school_model.dart';
import '../../../core/models/subject_teacher.dart';
import '../../../core/models/teacher_user.dart';
import '../../../resources/auth_repository.dart';
import '../professor_service.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  ProfessorService professorService = ProfessorService();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  User? user = Modular.get<AuthRepository>().usuario;

  @observable
  SchoolModel? schoolModel = SchoolModel(
    currentCycle: "",
    cnpj: "",
    name: '',
  );

  @observable
  TeacherUser? teacherUser =
      TeacherUser(name: '', schoolId: '', type: 2, cpf: '');

  @observable
  bool loading = false;

  //Solicita as informações da escola ao firebase
  @action
  Future initHome() async {
    loading = true;
    teacherUser = await professorService.getUserTeacherById(user!.uid);
    schoolModel =
        await professorService.getSchoolInformations(teacherUser!.schoolId);
    classes = await professorService.getClasses(
        teacherUser!.schoolId, schoolModel!.currentCycle);
    await setSubjectTeacher(classes!, teacherUser!.id!);
    loading = false;
  }

  @action
  setSubjectTeacher(List<Classes> classesList, String teacherId) async {
    //lista de indexes que irei remover
    List<int> toRemove = [];
    List<int> subjectTeacherToRemove = [];
    //Percorrendo lista de turmas
    for (var a = 0; a < classesList.length; a++) {
      //retorna lista de subject teacher de cada turma
      List<SubjectTeacher> lista =
          await professorService.getSubjectTeacher(classes![a].id);

      //verifica os subjectTeacher da lista que não possuem o id do professor
      for (var b = 0; b < lista.length; b++) {
        if (lista[b].idTeacher != teacherId) {
          subjectTeacherToRemove.add(b);
        }
      }
      //remove os que não possuem
      subjectTeacherToRemove.forEach((element) {
        lista.remove(lista[element]);
      });

      classes![a].subjectTeachers = lista;

      //Adiciona o index da turma caso não tenha nenhum na lista
      if (lista.length == 0) {
        toRemove.add(a);
      }
    }
    //remove da lista os que não possuem
    toRemove.forEach((element) {
      classes!.remove(classes![element]);
    });
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
}
