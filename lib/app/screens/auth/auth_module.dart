import 'package:flutter_modular/flutter_modular.dart';

import 'forgot_password/forgot.dart';
import 'login/login_screen.dart';
import 'register_school/register_school.dart';
import 'register_student/register_student_controller.dart';
import 'register_student/register_student_page.dart';
import 'register_teacher/register_teacher_controller.dart';
import 'register_teacher/register_teacher_page.dart';
import 'welcome/welcome.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => RegisterTeacherController()),
        Bind.lazySingleton((i) => RegisterStudentController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => Welcome()),
        ChildRoute('/login', child: (_, args) => LoginScreen()),
        ChildRoute('/register-school', child: (_, args) => RegisterSchool()),
        ChildRoute('/register-teacher',
            child: (_, args) => RegisterTeacherPage()),
        ChildRoute('/register-student',
            child: (_, args) => RegisterStudentPage()),
        ChildRoute('/forgot', child: (_, args) => ForgotPasswordScreen()),
      ];
}
