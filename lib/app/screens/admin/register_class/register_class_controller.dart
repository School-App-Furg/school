import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../../core/components/loader/loader_default.dart';
import '../../../core/models/student_user.dart';
import '../../../core/models/subject.dart';
import '../../../core/models/subject_teacher.dart';
import '../../../core/models/teacher_user.dart';

import '../../../core/service/snackbars.dart';
import '../admin_service.dart';
import '../home_page/home_controller.dart';

part 'register_class_controller.g.dart';

class RegisterClassController = _RegisterClassControllerBase
    with _$RegisterClassController;

abstract class _RegisterClassControllerBase with Store {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController roomController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  AdminService _adminService = AdminService();

  //injeção de depencias do user admin
  String schoolId = Modular.get<HomeController>().userAdmin!.schoolId;
  String currentCycle = Modular.get<HomeController>().schoolModel!.currentCycle;

  //lista de estudandes da escola
  @observable
  List<StudentUser> students = [];

  //get da lista de estudantes
  @action
  Future getStudents() async {
    students = await _adminService.getStudentsBySchoolId(schoolId);
  }

  //lista de ids de estudantes selecionados
  @observable
  List<String> studentsSelected = [];

  //recebe os valores selecionados no multiSelect dos students
  @action
  setStudentsSelected(List values) {
    values.forEach(
      (element) {
        subjectsSelected.add(element.id);
      },
    );
  }

  @observable
  List<Subject>? subjects = [];

  @action
  Future getSubjectsAndTeachers() async {
    subjects = await _adminService.getSubjects(schoolId);
    subjects!.forEach(
      (subjectsList) {
        subjectsList.teachers!.forEach(
          (element) async {
            TeacherUser? user = await _adminService.getUserTeacherById(element);
            subjectTeacher.add(
              SubjectTeacher(
                  id: user!.id, subject: subjectsList.name, teacher: user.name),
            );
          },
        );
      },
    );
  }

  @observable
  ObservableList<SubjectTeacher> subjectTeacher =
      ObservableList<SubjectTeacher>();

  @observable
  List subjectsSelected = [];

  //recebe os valores selecionados no multiSelect dos students
  @action
  setSubjectsSelected(List values) {
    values.forEach(
      (element) {
        subjectsSelected.add(element.id);
      },
    );
  }

  bool inserted = true;
  cadastrar(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      final loader = LoaderDefault();
      try {
        loader.show();

        if (inserted) {
          loader.hide();
          buildSnackBarUi(context, "Turma cadastrada com sucesso!");
        } else {
          loader.hide();
          buildSnackBarUi(context, "A turma não foi cadastrada corretamente!");
        }
      } catch (e) {
        loader.hide();
        buildSnackBarUi(context, e.toString());
      }
    }
  }
}
