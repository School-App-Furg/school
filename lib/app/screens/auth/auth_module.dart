import 'package:flutter_modular/flutter_modular.dart';
import 'package:school/app/screens/admin/register_student/register_student_page.dart';
import 'package:school/app/screens/admin/register_teacher/register_teacher_page.dart';
import 'login/login_screen.dart';
import 'register_school/register_school.dart';
import 'welcome/welcome.dart';

import 'forgot_password/forgot.dart';

class AuthModule extends Module {
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
