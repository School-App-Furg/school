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
    studentsSelected.clear();
    values.forEach(
      (element) {
        studentsSelected.add(element);
      },
    );
  }

  //lista de disciplinas
  @observable
  List<Subject>? subjects = [];

  //lista de alunos
  @observable
  List<TeacherUser>? teachers = [];

  //bool para carregamento dos dados
  @observable
  bool loadingTest = false;

  //Recebe as informações da disciplina+professor disponíveis
  @action
  getSubjectsAndTeachers() async {
    loadingTest = true;
    subjects = await _adminService.getSubjects(schoolId);
    teachers = await _adminService.getTeachers(schoolId);
    teachers!.forEach(
      (elementTeacher) {
        elementTeacher.subjects!.forEach(
          (elementTeacherSubject) {
            subjects!.forEach(
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
    loadingTest = false;
  }

  //Lista de disciplina+professor
  @observable
  List<SubjectTeacher> subjectTeacher = [];

  //Lista de disciplinas selecionadas
  @observable
  List subjectsSelected = [];

  //recebe os valores selecionados no multiSelect dos students
  @action
  setSubjectsSelected(List values) {
    subjectsSelected.clear();
    values.forEach(
      (element) {
        subjectsSelected.add(
          SubjectTeacher(
              idTeacher: element.idTeacher,
              idSubject: element.idSubject,
              subject: element.subject,
              teacher: element.teacher),
        );
      },
    );
  }

  //Realiza o cadastro da turma
  cadastrar(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      final loader = LoaderDefault();
      try {
        loader.show();
        Classes classes = Classes(
            schoolId: schoolId,
            name: nameController.text,
            room: roomController.text,
            cycleId: currentCycle,
            level: yearController.text,
            students: studentsSelected);
        String doc = await _adminService.insertClasses(classes);
        subjectsSelected.forEach(
          (element) {
            _adminService.insertSubjectTeacher(element, doc);
          },
        );
        if (doc.isNotEmpty) {
          _adminService.updateHome();
          loader.hide();
          Modular.to.pop();
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
