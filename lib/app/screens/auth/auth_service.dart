import 'package:firebase_auth/firebase_auth.dart';
import '../../core/models/cycle.dart';
import '../../core/models/school_model.dart';
import '../../core/models/user_admin.dart';
import '../../resources/auth_repository.dart';

import '../../resources/cycle_repository.dart';
import '../../resources/school_repository.dart';
import '../../resources/users_repository.dart';

class AuthService {
  SchoolRepository _schoolRepository = SchoolRepository();
  UsersRepository _userRepository = UsersRepository();
  CycleRepository _cycleRepository = CycleRepository();
  AuthRepository _authRepository = AuthRepository();

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

  //Cadastro de usuário admin
  Future<bool> insertUserAdmin(String userId, UserAdmin userAdmin) async {
    try {
      return await _userRepository.insertUserAdmin(userId, userAdmin);
    } catch (error) {
      throw Exception(error);
    }
  }

  //Cadastro de ciclo da escola
  Future<bool> insertCycleSchool(String cicleId, Cycle cycle) async {
    try {
      return await _cycleRepository.insertCycleSchool(cicleId, cycle);
    } catch (error) {
      throw Exception(error);
    }
  }
}
