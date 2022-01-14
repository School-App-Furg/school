import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../../core/components/loader/loader_default.dart';
import '../../../core/models/classes.dart';
import '../../../core/models/student_user.dart';
import '../../../core/models/subject_teacher.dart';
import '../../../core/models/teacher_user.dart';
import '../../../core/service/snackbars.dart';
import '../admin_service.dart';
import '../home_page/home_controller.dart';

import '../../../core/models/subject.dart';

part 'edit_class_controller.g.dart';

class EditClassController = _EditClassControllerBase with _$EditClassController;

abstract class _EditClassControllerBase with Store {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController roomController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  AdminService _adminService = AdminService();

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

  @observable
  Classes classesReceived =
      Classes(schoolId: '', name: '', room: '', cycleId: '', level: '');

  @observable
  List<StudentUser> listOfStudentsSelected = [];

  @action
  getStudentsPreviusSelected(Classes classes) {
    classes.students!.forEach(
      (element) {
        students.forEach(
          (student) {
            if (element == student.id) {
              listOfStudentsSelected.add(student);
            }
          },
        );
      },
    );
  }

  List<SubjectTeacher> previusList = [];

  @action
  getSubjectsTeacherPreviusSelected(Classes classes) async {
    previusList = await _adminService.getSubjectTeacher(classes.id);
    previusList.forEach(
      (element1) {
        subjectTeacher.forEach(
          (element2) {
            if (element1.idSubject == element2.idSubject &&
                element1.idTeacher == element2.idTeacher) {
              listOfSubjectTeachersSelected.add(element2);
            }
          },
        );
      },
    );
  }

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
    values.forEach(
      (element) {
        studentsSelected.add(element.id);
      },
    );
  }

  @observable
  List<Subject> subjects = [];

  @observable
  List<TeacherUser> teachers = [];

  @observable
  List<SubjectTeacher> subjectTeacher = [];

  @observable
  bool loadingTest = false;

  @action
  Future getSubjectsAndTeachers() async {
    subjects = await _adminService.getSubjects(schoolId);
    teachers = await _adminService.getTeachers(schoolId);
    teachers.forEach(
      (elementTeacher) {
        elementTeacher.subjects!.forEach(
          (elementTeacherSubject) {
            subjects.forEach(
              (elementSubject) {
                if (elementTeacherSubject == elementSubject.id) {
                  subjectTeacher.add(
                    SubjectTeacher(
                        idSubject: elementSubject.id ?? '',
                        subject: elementSubject.name,
                        idTeacher: elementTeacher.id ?? '',
                        teacher: elementTeacher.name),
                  );
                }
              },
            );
          },
        );
      },
    );
  }

  @observable
  List<SubjectTeacher> subjectsTeacherSelected = [];

  //recebe os valores selecionados no multiSelect dos students
  @action
  setSubjectsSelected(List values) {
    subjectsTeacherSelected.clear();
    values.forEach(
      (element) {
        subjectsTeacherSelected.add(
          SubjectTeacher(
              id: element.id,
              idTeacher: element.idTeacher,
              idSubject: element.idSubject,
              subject: element.subject,
              teacher: element.teacher),
        );
      },
    );
  }

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
        bool updated = await _adminService.updateClass(classesReceived);
        bool updatedSubjectTeacher = updateSubjectTeacher();
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

  bool updateSubjectTeacher() {
    try {
      if (subjectsTeacherSelected.isNotEmpty) {
        List previusRemove = [];
        List subjectRemove = [];
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

        previusRemove.forEach(
          (element) {
            previusList.remove(
              previusList[element],
            );
          },
        );

        subjectRemove.forEach(
          (element) {
            subjectsTeacherSelected.remove(
              subjectsTeacherSelected[element],
            );
          },
        );

        subjectsTeacherSelected.forEach(
          (element) async {
            await _adminService.insertSubjectTeacher(
                element, classesReceived.id ?? '');
          },
        );
        previusList.forEach(
          (element) async {
            await _adminService.deleteSubjectTeacher(
                element, classesReceived.id ?? '');
          },
        );
      }

      return true;
    } catch (e) {
      throw Exception(e);
    }
  }
}
