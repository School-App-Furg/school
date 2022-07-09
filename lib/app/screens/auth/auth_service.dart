import 'package:firebase_auth/firebase_auth.dart';

import '../../core/models/cycle.dart';
import '../../core/models/school_model.dart';
import '../../core/models/student_user.dart';
import '../../core/models/teacher_user.dart';
import '../../core/models/user_admin.dart';
import '../../resources/auth_repository.dart';
import '../../resources/cycle_repository.dart';
import '../../resources/school_repository.dart';
import '../../resources/users_repository.dart';

class AuthService {
  final SchoolRepository _schoolRepository = SchoolRepository();
  final UsersRepository _userRepository = UsersRepository();
  final CycleRepository _cycleRepository = CycleRepository();
  final AuthRepository _authRepository = AuthRepository();

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

  //cadastro de escolas
  Future<String> insertScholl(SchoolModel schoolModel) async {
    try {
      return await _schoolRepository.insertScholl(schoolModel);
    } catch (error) {
      throw Exception(error);
    }
  }

  //listagem de escolas
  Future<List<SchoolModel?>> getSchools() async {
    try {
      return await _schoolRepository.getSchools();
    } catch (error) {
      throw Exception(error);
    }
  }

  //Cadastro de usuário admin
  Future<bool> insertUserAdmin(String userId, UserAdmin userAdmin) async {
    try {
      return await _userRepository.insertUserAdmin(userId, userAdmin);
    } catch (error) {
      throw Exception(error);
    }
  }

  //Cadastro de ciclo da escola
  Future<String> insertCycleSchool(String cicleId, Cycle cycle) async {
    try {
      return await _cycleRepository.insertCycle(cycle);
    } catch (error) {
      throw Exception(error);
    }
  }

  //Cadastro do primeiro ciclo da escola
  Future<bool> insertFirstCycleSchool(String cicleId, Cycle cycle) async {
    try {
      await _cycleRepository.insertFirstCycle(cicleId, cycle);
      return true;
    } catch (error) {
      throw Exception(error);
    }
  }

  //Cadastro de ciclo da escola
  Future<int> getUserType(String userId) async {
    try {
      return await _userRepository.getUserType(userId);
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

  //cadastro de professores
  Future<bool> insertStudent(String userId, StudentUser studentUser) async {
    try {
      return await _userRepository.insertStudent(userId, studentUser);
    } catch (error) {
      throw Exception(error);
    }
  }
}
