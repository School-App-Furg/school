import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:school/app/core/models/cycle.dart';
import 'package:school/app/core/models/grade.dart';

import '../../../core/models/subject_teacher.dart';
import '../aluno_service.dart';

import '../../../core/models/school_model.dart';
import '../../../core/models/student_user.dart';

import '../../../resources/auth_repository.dart';
import 'student_report_generator/model/boletim_model.dart';
import 'student_report_generator/pdf_gerar/gerar_boletim_pdfi.dart';
import 'student_report_generator/pdf_gerar/open_pdf.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  AlunoService alunoService = AlunoService();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  User? user = Modular.get<AuthRepository>().usuario;

  Cycle? cycle = Cycle(
    name: "",
    idSchool: "",
    finalDate: DateTime.now().millisecondsSinceEpoch,
    initialDate: DateTime.now().millisecondsSinceEpoch,
    approvalPattern: '',
    evaluationStandard: '',
  );

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

  List<Grade> grade = [
    Grade(
        student: 'student',
        cycle: 'cycle',
        subject: 'subject',
        note: 0,
        timeCourse: 0,
        faults: 0,
        teacher: 'teacher',
        classe: 'classe'),
    Grade(
        student: 'student',
        cycle: 'cycle',
        subject: 'subject',
        note: 8,
        timeCourse: 1,
        faults: 2,
        teacher: 'teacher',
        classe: 'classe'),
    Grade(
        student: 'student',
        cycle: 'cycle',
        subject: 'subject1',
        note: 9,
        timeCourse: 0,
        faults: 3,
        teacher: 'teacher1',
        classe: 'classe'),
    Grade(
        student: 'student',
        cycle: 'cycle',
        subject: 'subject1',
        note: 10,
        timeCourse: 1,
        faults: 2,
        teacher: 'teacher1',
        classe: 'classe'),
  ];

  //Solicita as informações do aluno ao firebase
  @action
  Future initHome() async {
    loading = true;
    userStudent = await alunoService.getUserStudentById(user!.uid);
    schoolModel =
        await alunoService.getSchoolInformations(userStudent!.schoolId);
    cycle = await alunoService.getCurrentCycle(schoolModel!.currentCycle);
    subjects = await alunoService.getSubjectsForStudent(
        schoolModel!.id!, schoolModel!.currentCycle, userStudent!.id!);
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

  List<ItensBoletim> notas = [];
  setNotes(List<Grade> lista) {
    for (var a = 0; a < lista.length; a++) {
      List<Grade> igual = [];
      igual.add(lista[a]);
      for (var b = (a + 1); b < (lista.length - (a + 1)); b++) {
        if (lista[a].subject == lista[b].subject) {
          igual.add(lista[b]);
          soma++;
        }
      }
    }
    print(soma);
  }

  int soma = 0;

  buildReport() async {
    setNotes(grade);
    Boletim boletim = Boletim(
      cycleName: cycle!.name,
      schoolName: schoolModel!.name,
      studentName: userStudent!.name,
      items: notas.toList(),
    );
    final pdfFile = await ReportGenerator.generate(boletim);
    PdfOpen.openFile(pdfFile);
  }
}
