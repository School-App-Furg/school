import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/components/loader/loader_default.dart';
import '../../../core/models/classes.dart';
import '../../../core/models/student_user.dart';
import '../../../core/models/subject.dart';
import '../../../core/models/subject_teacher.dart';
import '../../../core/models/teacher_user.dart';
import '../../../core/service/snackbars.dart';
import '../admin_service.dart';
import '../home_page/home_controller.dart';

part 'edit_class_controller.g.dart';

class EditClassController = _EditClassControllerBase with _$EditClassController;

abstract class _EditClassControllerBase with Store {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController roomController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  final AdminService _adminService = AdminService();

  //Solicita as informações da turma ao firebase
  @action
  initEditClass(Classes classes) async {
    loadingTest = true;
    classesReceived = classes;
    students = await _adminService.getStudentsBySchoolId(schoolId);
    await getSubjectsAndTeachers();
    roomController.text = classes.room;
    nameController.text = classes.name;
    yearController.text = classes.level;
    await getStudentsPreviusSelected(classes);
    await getSubjectsTeacherPreviusSelected(classes);
    loadingTest = false;
  }

  //Classe sendo inicializada
  @observable
  Classes classesReceived =
      Classes(schoolId: '', name: '', room: '', cycleId: '', level: '');

  //Lista de alunos selecionados
  @observable
  List<StudentUser> listOfStudentsSelected = [];

  //Recebe as informações do aluno selecionado anteriormente
  @action
  getStudentsPreviusSelected(Classes classes) {
    for (final element in classes.students!) {
      for (final student in students) {
        if (element == student.id) {
          listOfStudentsSelected.add(student);
        }
      }
    }
  }

  //Lista de disciplina anterior
  List<SubjectTeacher> previusList = [];

  //Recebe as informações da disciplina+professor selecionados anteriormente
  @action
  getSubjectsTeacherPreviusSelected(Classes classes) async {
    previusList = await _adminService.getSubjectTeacher(classes.id);
    for (final element1 in previusList) {
      for (final element2 in subjectTeacher) {
        if (element1.idSubject == element2.idSubject &&
            element1.idTeacher == element2.idTeacher) {
          listOfSubjectTeachersSelected.add(element2);
        }
      }
    }
  }

  //Lista de disciplina+professor selecionada
  @observable
  List<SubjectTeacher> listOfSubjectTeachersSelected = [];

  //injeção de depencias do user admin
  String schoolId = Modular.get<HomeController>().userAdmin!.schoolId;
  String currentCycle = Modular.get<HomeController>().schoolModel!.currentCycle;

  //lista de estudandes da escola
  @observable
  List<StudentUser> students = [];

  //lista de ids de estudantes selecionados
  @observable
  List<String> studentsSelected = [];

  //recebe os valores selecionados no multiSelect dos students
  @action
  setStudentsSelected(List values) {
    studentsSelected.clear();
    for (final element in values) {
      studentsSelected.add(element.id);
    }
  }

  //Lista de disciplina
  @observable
  List<Subject> subjects = [];

  //Lista de professor
  @observable
  List<TeacherUser> teachers = [];

  //Lista de disciplina+professor
  @observable
  List<SubjectTeacher> subjectTeacher = [];

  //bool para carregamento dos dados
  @observable
  bool loadingTest = false;

  //Recebe as informações da disciplina+professor disponíveis
  @action
  Future getSubjectsAndTeachers() async {
    subjects = await _adminService.getSubjects(schoolId);
    teachers = await _adminService.getTeachers(schoolId);
    for (final elementTeacher in teachers) {
      for (final elementTeacherSubject in elementTeacher.subjects!) {
        for (final elementSubject in subjects) {
          if (elementTeacherSubject == elementSubject.id) {
            subjectTeacher.add(
              SubjectTeacher(
                  idSubject: elementSubject.id ?? '',
                  subject: elementSubject.name,
                  idTeacher: elementTeacher.id ?? '',
                  teacher: elementTeacher.name),
            );
          }
        }
      }
    }
  }

  @observable
  List<SubjectTeacher> subjectsTeacherSelected = [];

  //seta os valores selecionados no multiSelect dos students
  @action
  setSubjectsSelected(List values) {
    subjectsTeacherSelected.clear();
    for (final element in values) {
      subjectsTeacherSelected.add(
        SubjectTeacher(
            id: element.id,
            idTeacher: element.idTeacher,
            idSubject: element.idSubject,
            subject: element.subject,
            teacher: element.teacher),
      );
    }
  }

  //Atualiza a edição da turma
  update(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      final loader = LoaderDefault();
      try {
        loader.show();
        classesReceived.name = nameController.text;
        classesReceived.room = roomController.text;
        classesReceived.level = yearController.text;
        if (studentsSelected.isNotEmpty) {
          classesReceived.students = studentsSelected;
        }
        final bool updated = await _adminService.updateClass(classesReceived);
        final bool updatedSubjectTeacher = await updateSubjectTeacher();
        if (updated && updatedSubjectTeacher) {
          _adminService.updateHome();
          loader.hide();
          Modular.to.pop();
          buildSnackBarUi(context, "Turma atualizada com sucesso!");
        } else {
          loader.hide();
          buildSnackBarUi(context, "A turma não foi atualizada corretamente!");
        }
      } catch (e) {
        loader.hide();
        buildSnackBarUi(context, e.toString());
      }
    }
  }

  //Atualiza a seleção da disciplina+professor
  Future<bool> updateSubjectTeacher() async {
    try {
      if (subjectsTeacherSelected.isNotEmpty) {
        final List previusRemove = [];
        final List subjectRemove = [];
        for (var a = 0; a < previusList.length; a++) {
          for (var b = 0; b < subjectsTeacherSelected.length; b++) {
            if (previusList[a].idSubject ==
                    subjectsTeacherSelected[b].idSubject &&
                previusList[a].idTeacher ==
                    subjectsTeacherSelected[b].idTeacher) {
              previusRemove.add(a);
              subjectRemove.add(b);
            }
          }
        }

        for (final element in previusRemove) {
          previusList.remove(
            previusList[element],
          );
        }

        for (final element in subjectRemove) {
          subjectsTeacherSelected.remove(
            subjectsTeacherSelected[element],
          );
        }

        for (final element in subjectsTeacherSelected) {
          await _adminService.insertSubjectTeacher(
              element, classesReceived.id ?? '');
        }
        for (final element in previusList) {
          await _adminService.deleteSubjectTeacher(
              element, classesReceived.id ?? '');
        }
      }

      return true;
    } catch (e) {
      throw Exception(e);
    }
  }
}
