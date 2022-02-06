import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/models/classes.dart';
import '../../core/models/cycle.dart';
import '../../core/models/grade.dart';
import '../../core/models/school_model.dart';
import '../../core/models/student_user.dart';
import '../../core/models/subject.dart';
import '../../core/models/subject_teacher.dart';
import '../../core/models/teacher_user.dart';
import '../../resources/auth_repository.dart';
import '../../resources/classes_repository.dart';
import '../../resources/cycle_repository.dart';
import '../../resources/grades_repository.dart';
import '../../resources/school_repository.dart';
import '../../resources/subjects_repository.dart';
import '../../resources/users_repository.dart';
import 'home_page/home_controller.dart';

class ProfessorService {
  SchoolRepository _schoolRepository = SchoolRepository();
  UsersRepository _userRepository = UsersRepository();
  ClassesRepository _classesRepository = ClassesRepository();
  SubjectRepository _subjectRepository = SubjectRepository();
  AuthRepository _authRepository = AuthRepository();
  CycleRepository _cycleRepository = CycleRepository();
  GradesRepository _gradesRepository = GradesRepository();

  //serviço para solicitar as informações da escola atrelada ao usuario
  Future<SchoolModel?> getSchoolInformations(String schoolId) async {
    try {
      SchoolModel? schoolModel =
          await _schoolRepository.getSchoolInformationsById(schoolId);
      return schoolModel;
    } catch (error) {
      throw Exception(error);
    }
  }

  //solicita as informacoes do user teacher
  Future<TeacherUser?> getUserTeacherById(String userId) async {
    try {
      return await _userRepository.getUserTeacherById(userId);
    } catch (error) {
      throw Exception(error);
    }
  }

  //serviço para solicitar lista de turmas
  Future<List<Classes>> getClasses(String schoolId, String cycle) async {
    try {
      return await _classesRepository.getClassesBySchoolId(schoolId, cycle);
    } catch (error) {
      throw Exception(error);
    }
  }

  //serviço de listagem de disciplinas e seu professor
  Future<List<SubjectTeacher>> getSubjectTeacher(String? classeId) async {
    try {
      return await _classesRepository.getSubjectTeacher(classeId);
    } catch (error) {
      throw Exception(error);
    }
  }

  //serviço para solicitar lista de disciplinas
  Future<List<Subject>> getSubjects(String schoolId) async {
    try {
      List<Subject> list = await _subjectRepository.getSubjects(schoolId);
      return list;
    } catch (error) {
      throw Exception(error);
    }
  }

  //atualizar professor
  Future<bool> updateTeacher(TeacherUser teacher) async {
    try {
      return await _userRepository.updateTeacher(teacher);
    } catch (error) {
      throw Exception(error);
    }
  }

  //Requisita uma nova senha com base no email
  Future<bool> requestNewPassword(String mail) async {
    try {
      await _authRepository.requestNewPassword(mail);
      return true;
    } catch (error) {
      throw Exception(error);
    }
  }

  //pegar dados do ciclo
  Future<Cycle?> getCurrentCycle(String uid) async {
    try {
      return await _cycleRepository.getCurrentCycle(uid);
    } catch (error) {
      throw Exception(error);
    }
  }

  //listagem de notas e faltas de uma turma p/ o professor com base nos atributos da classe Grade
  Future<ObservableList<Grade>> getGradesForTeacher(List<String> students,
      String cycleId, String idSubject, String idTeacher) async {
    try {
      return await _gradesRepository.getGradesForTeacher(
          students, cycleId, idSubject, idTeacher);
    } catch (error) {
      throw Exception(error);
    }
  }

  //listagem de estudantes de uma turma
  Future<List<StudentUser>> getStudentsForClass(List<String> list) async {
    try {
      return await _userRepository.getStudentsForClass(list);
    } catch (error) {
      throw Exception(error);
    }
  }

  //atualizar nota
  Future<bool> updateGrade(String id, num note, num faults) async {
    try {
      return await _gradesRepository.updateGrade(id, note, faults);
    } catch (error) {
      throw Exception(error);
    }
  }

  //cadastrar nota
  Future<bool> insertGrade(Grade grade) async {
    try {
      return await _gradesRepository.insertGrade(grade);
    } catch (error) {
      throw Exception(error);
    }
  }

  //listagem de ciclos
  Future<List<Cycle?>> getCycles(String schoolId, String cycleId) async {
    try {
      return await _cycleRepository.getCycles(schoolId, cycleId);
    } catch (error) {
      throw Exception(error);
    }
  }

  //listagem de alunos da escola
  Future<List<StudentUser>> getStudentsBySchoolId(String schoolId) async {
    try {
      return await _userRepository.getStudentsBySchoolId(schoolId);
    } catch (error) {
      throw Exception(error);
    }
  }

  //Atualização da tela inicial
  updateHome() {
    Modular.get<HomeController>().initHome();
  }
}
