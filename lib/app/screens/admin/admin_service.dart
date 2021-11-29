import 'package:firebase_auth/firebase_auth.dart';
import 'package:school/app/core/models/student_user.dart';
import 'package:school/app/core/models/subject.dart';
import 'package:school/app/core/models/teacher_user.dart';
import 'package:school/app/resources/auth_repository.dart';
import 'package:school/app/resources/subjects_repository.dart';

import '../../core/models/classes.dart';
import '../../core/models/school_model.dart';
import '../../core/models/user_admin.dart';
import '../../resources/classes_repository.dart';
import '../../resources/school_repository.dart';
import '../../resources/users_repository.dart';

class AdminService {
  SchoolRepository _schoolRepository = SchoolRepository();
  UsersRepository _userRepository = UsersRepository();
  ClassesRepository _classesRepository = ClassesRepository();
  SubjectRepository _subjectRepository = SubjectRepository();
  AuthRepository _authRepository = AuthRepository();

  //serviço para solicitar as informações da escola atrelada ao usuario
  Future<SchoolModel?> getSchoolInformations(String schoolid) async {
    try {
      SchoolModel? schoolModel =
          await _schoolRepository.getSchoolInformationsById(schoolid);
      return schoolModel;
    } catch (error) {
      throw Exception(error);
    }
  }

  //solicita as informacoes do user admin
  Future<UserAdmin?> getUserAdminById(String userId) async {
    try {
      return await _userRepository.getUserAdminById(userId);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<bool> insertSubject(Subject subject) async {
    try {
      return await _subjectRepository.insertSubject(subject);
    } catch (error) {
      throw Exception(error);
    }
  }

  //serviço para solicitar lista de turmas
  Future<List<Classes>?> getClasses(String schoolid, String cycle) async {
    try {
      List<Classes>? list =
          await _classesRepository.getClassesBySchoolId(schoolid, cycle);
      return list;
    } catch (error) {
      throw Exception(error);
    }
  }

  //serviço para solicitar lista de disciplinas
  Future<List<Subject>?> getSubjects(String schoolid) async {
    try {
      List<Subject>? list = await _subjectRepository.getSubjects(schoolid);
      return list;
    } catch (error) {
      throw Exception(error);
    }
  }

  //criação de usuários
  Future<User?>? createUserWithEmailPass(String email, String pass) async {
    try {
      return await _authRepository.createUserWithEmailPass(
        email,
        pass,
      );
    } catch (error) {
      throw Exception(error);
    }
  }

  //cadastro de professores
  Future<bool> insertTeacher(String userId, TeacherUser teacherUser) async {
    try {
      return await _userRepository.insertTeacher(userId, teacherUser);
    } catch (error) {
      throw Exception(error);
    }
  }

  //cadastro de alunos
  Future<bool> insertStudent(String userId, StudentUser studentUser) async {
    try {
      return await _userRepository.insertStudent(userId, studentUser);
    } catch (error) {
      throw Exception(error);
    }
  }
}
