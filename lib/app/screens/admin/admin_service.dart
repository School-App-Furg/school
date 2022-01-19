import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/models/classes.dart';
import '../../core/models/cycle.dart';
import '../../core/models/management_user.dart';
import '../../core/models/school_model.dart';
import '../../core/models/student_user.dart';
import '../../core/models/subject.dart';
import '../../core/models/subject_teacher.dart';
import '../../core/models/teacher_user.dart';
import '../../core/models/user_admin.dart';
import '../../resources/auth_repository.dart';
import '../../resources/classes_repository.dart';
import '../../resources/cycle_repository.dart';
import '../../resources/school_repository.dart';
import '../../resources/subjects_repository.dart';
import '../../resources/users_repository.dart';
import 'home_page/home_controller.dart';

class AdminService {
  SchoolRepository _schoolRepository = SchoolRepository();
  UsersRepository _userRepository = UsersRepository();
  ClassesRepository _classesRepository = ClassesRepository();
  SubjectRepository _subjectRepository = SubjectRepository();
  AuthRepository _authRepository = AuthRepository();
  CycleRepository _cycleRepository = CycleRepository();

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

  //solicita as informacoes do user admin
  Future<UserAdmin?> getUserAdminById(String userId) async {
    try {
      return await _userRepository.getUserAdminById(userId);
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

  //solicita as informacoes do user teacher
  Future<StudentUser?> getUserStudentById(String userId) async {
    try {
      return await _userRepository.getUserStudentById(userId);
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

  Future<bool> updateSubject(Subject subject) async {
    try {
      return await _subjectRepository.updateSubject(subject);
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

  //serviço de cadastro de turmas
  Future<String> insertClasses(Classes classes) async {
    try {
      return await _classesRepository.insertClass(classes);
    } catch (error) {
      throw Exception(error);
    }
  }

  //serviço de cadastro de turmas
  Future<bool> updateClass(Classes classes) async {
    try {
      return await _classesRepository.updateClass(classes);
    } catch (error) {
      throw Exception(error);
    }
  }

  //serviço de cadastro de turmas
  Future<bool> deleteClass(String classId) async {
    try {
      return await _classesRepository.deleteClass(classId);
    } catch (error) {
      throw Exception(error);
    }
  }

  //serviço de cadastro de turmas
  Future<bool> insertSubjectTeacher(
      SubjectTeacher subjectTeacher, String doc) async {
    try {
      return await _classesRepository.insertSubjectTeacher(subjectTeacher, doc);
    } catch (error) {
      throw Exception(error);
    }
  }

  //serviço de remoção de cadastro professor - disciplina
  Future<bool> deleteSubjectTeacher(
      SubjectTeacher subjectTeacher, String doc) async {
    try {
      return await _classesRepository.deleteSubjectTeacher(subjectTeacher, doc);
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

  //serviço para solicitar lista de professores de uma escola
  Future<List<TeacherUser>> getTeachers(String schoolId) async {
    try {
      List<TeacherUser> list = await _userRepository.getTeachers(schoolId);
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

  //cadastro de auxiliares
  Future<bool> insertManagement(
      String userId, ManagementUser managementUser) async {
    try {
      return await _userRepository.insertManagement(userId, managementUser);
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

  //listagem de alunos da escola
  Future<List<StudentUser>> getStudentsBySchoolId(String schoolId) async {
    try {
      return await _userRepository.getStudentsBySchoolId(schoolId);
    } catch (error) {
      throw Exception(error);
    }
  }

  //remover disciplina
  Future<bool> removeSubject(String idSubject) async {
    try {
      return await _subjectRepository.removeSubject(idSubject);
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

  //atualizar professor
  Future<bool> updateStudent(StudentUser student) async {
    try {
      return await _userRepository.updateStudent(student);
    } catch (error) {
      throw Exception(error);
    }
  }

  //atualizar escola
  Future<bool> updateSchool(SchoolModel schoolModel) async {
    try {
      return await _schoolRepository.updateSchool(schoolModel);
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

  //Cadastro de ciclo da escola
  Future<String> insertCycle(Cycle cycle) async {
    try {
      return await _cycleRepository.insertCycle(cycle);
    } catch (error) {
      throw Exception(error);
    }
  }

  //atualização de ciclo da escola
  Future<bool> updateCycle(String cicleId, Cycle cycle) async {
    try {
      return await _cycleRepository.updateCycle(cicleId, cycle);
    } catch (error) {
      throw Exception(error);
    }
  }

  //atualização de ciclo da escola
  Future<bool> updateCycleSchool(String cycleId, String schoolId) async {
    try {
      return await _schoolRepository.updateCycleSchool(cycleId, schoolId);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<bool> requestNewPassword(String mail) async {
    try {
      await _authRepository.requestNewPassword(mail);
      return true;
    } catch (error) {
      throw Exception(error);
    }
  }

  updateHome() {
    Modular.get<HomeController>().initHome();
  }
}
