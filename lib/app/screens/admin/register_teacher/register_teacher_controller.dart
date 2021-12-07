import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../../core/components/loader/loader_default.dart';
import '../../../core/models/subject.dart';

import '../../../core/models/teacher_user.dart';
import '../../../core/service/snackbars.dart';
import '../admin_service.dart';
import '../home_page/home_controller.dart';

part 'register_teacher_controller.g.dart';

class RegisterTeacherController = _RegisterTeacherControllerBase
    with _$RegisterTeacherController;

abstract class _RegisterTeacherControllerBase with Store {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  AdminService _adminService = AdminService();

  //injeção de depencias da user admin
  String schoolId = Modular.get<HomeController>().userAdmin!.schoolId;

  //lista de disciplinas da escola
  @observable
  List<Subject>? subjects = [];

  //listagem de disciplinas da escoa
  @action
  getSubjects() async {
    subjects = await _adminService.getSubjects(schoolId);
  }

  //disciplinas selecionadas
  @observable
  List<String> subjectsSelected = [];

  //recebe os valores selecionados no multiSelect
  @action
  setSubjectsSelected(List values) {
    values.forEach(
      (element) {
        subjectsSelected.add(element.id);
      },
    );
  }

  //recebe o id do usuário a ser cadastrado, percorre a lista de selecionados para encontrar o subject com o mesmo id, atualizar a lista com o user cadastrado e enviar o objeto atualizado
  Future updateSubjects(String id) async {
    subjectsSelected.forEach(
      (subjectiD) {
        subjects!.forEach(
          (subjectObject) async {
            if (subjectObject.id == subjectiD) {
              subjectObject.teachers!.add(id);
              await _adminService.updateSubject(
                  subjectiD, subjectObject.teachers);
            }
          },
        );
      },
    );
  }

  cadastrar(BuildContext context) async {
    if (formKey.currentState!.validate() && subjectsSelected.isNotEmpty) {
      final loader = LoaderDefault();
      try {
        loader.show();

        //cadastra o user da escola
        User? user = await _adminService.createUserWithEmailPass(
          emailController.text,
          "escola123",
        );

        //update da disciplina acrescentando o professor
        await updateSubjects(user!.uid);

        //cadastra a escola e retorna o id da escola
        bool inserted = await _adminService.insertTeacher(
          user.uid,
          TeacherUser(
            name: nameController.text,
            schoolId: schoolId,
            type: 2,
          ),
        );
        if (inserted) {
          loader.hide();
          buildSnackBarUi(context, "Professor cadastrado com sucesso!");
          Modular.to.pop();
        } else {
          loader.hide();
          buildSnackBarUi(context, "Professor não foi cadastrado!");
        }
      } catch (e) {
        loader.hide();
        buildSnackBarUi(context, e.toString());
      }
    }
  }
}
