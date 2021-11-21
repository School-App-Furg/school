import 'package:flutter_modular/flutter_modular.dart';
import 'package:school/app/core/models/classes.dart';
import 'package:school/app/screens/repository/classes_repository.dart';
import '../../core/models/school_model.dart';
import '../../core/models/user_admin.dart';
import '../repository/auth_repository.dart';
import '../repository/school_repository.dart';
import '../repository/users_repository.dart';

class AdminService {
  SchoolRepository _schoolRepository = SchoolRepository();
  UsersRepository _userRepository = UsersRepository();
  ClassesRepository _classesRepository = ClassesRepository();

  //serviço para solicitar as informações da escola atrelada ao usuario
  Future<SchoolModel?> getSchoolInformations() async {
    try {
      String id = Modular.get<AuthRepository>().usuario!.uid;
      UserAdmin? userAdmin = await _userRepository.getUserAdminById(id);
      SchoolModel? schoolModel = await _schoolRepository
          .getSchoolInformationsById(userAdmin!.schoolid);
      return schoolModel;
    } catch (error) {
      throw Exception(error);
    }
  }

  //serviço para solicitar lista de turmas
  Future<List<Classes>?> getClasses() async {
    try {
      String id = Modular.get<AuthRepository>().usuario!.uid;
      UserAdmin? userAdmin = await _userRepository.getUserAdminById(id);
      List<Classes>? list =
          await _classesRepository.getClassesBySchoolId(userAdmin!.schoolid);
      return list;
    } catch (error) {
      throw Exception(error);
    }
  }
}
