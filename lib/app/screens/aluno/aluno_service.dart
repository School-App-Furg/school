import 'package:flutter_modular/flutter_modular.dart';

import '../../core/models/classes.dart';
import '../../core/models/cycle.dart';
import '../../core/models/grade.dart';
import '../../core/models/school_model.dart';
import '../../core/models/student_user.dart';
import '../../core/models/subject_teacher.dart';
import '../../resources/auth_repository.dart';
import '../../resources/classes_repository.dart';
import '../../resources/cycle_repository.dart';
import '../../resources/grades_repository.dart';
import '../../resources/school_repository.dart';
import '../../resources/users_repository.dart';
import 'home_page/home_controller.dart';

class AlunoService {
  SchoolRepository _schoolRepository = SchoolRepository();
  UsersRepository _userRepository = UsersRepository();
  ClassesRepository _classesRepository = ClassesRepository();
  CycleRepository _cycleRepository = CycleRepository();
  GradesRepository _gradesRepository = GradesRepository();
  AuthRepository _authRepository = AuthRepository();

  //solicita as informacoes do user aluno
  Future<StudentUser?> getUserStudentById(String userId) async {
    try {
      return await _userRepository.getUserStudentById(userId);
    } catch (error) {
      throw Exception(error);
    }
  }

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

  //serviço para solicitar as disciplinas do aluno
  Future<List<SubjectTeacher>> getSubjectsForStudent(
      String schoolId, String cycleId, String studentId) async {
    try {
      List<Classes>? myClass = await _classesRepository.getClassesForStudent(
          schoolId, cycleId, studentId);
      if (myClass!.length == 0) {
        return [];
      } else {
        return await _classesRepository.getSubjectTeacher(myClass[0].id);
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  //pega dados do ciclo
  Future<Cycle?> getCurrentCycle(String uid) async {
    try {
      return await _cycleRepository.getCurrentCycle(uid);
    } catch (error) {
      throw Exception(error);
    }
  }

  //Solicita as notas com base em uma disciplina
  Future<List<Grade>> getGradesForSubject(
      String studentId, String cycleId, String subject) async {
    try {
      return await _gradesRepository.getGradesForSubject(
          studentId, cycleId, subject);
    } catch (error) {
      throw Exception(error);
    }
  }

  //atualiza informações de um aluno
  Future<bool> updateStudent(StudentUser student) async {
    try {
      return await _userRepository.updateStudent(student);
    } catch (error) {
      throw Exception(error);
    }
  }

  //solicitação de uma nova senha
  Future<bool> requestNewPassword(String mail) async {
    try {
      await _authRepository.requestNewPassword(mail);
      return true;
    } catch (error) {
      throw Exception(error);
    }
  }

  //solicita a lista de cyclos de uma escola
  Future<List<Cycle?>> getCycles(String schoolId, String cycleId) async {
    try {
      return await _cycleRepository.getCycles(schoolId, cycleId);
    } catch (error) {
      throw Exception(error);
    }
  }

  //atualiza a home screen do aluno
  updateHome() {
    Modular.get<HomeController>().initHome();
  }
}
