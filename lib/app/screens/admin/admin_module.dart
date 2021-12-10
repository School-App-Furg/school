import 'package:flutter_modular/flutter_modular.dart';
import 'register_managers/register_manager_page.dart';

import 'config/config_page.dart';
import 'historic/historic_page.dart';
import 'home_page/home_controller.dart';
import 'home_page/home_page.dart';
import 'profile/profile_page.dart';
import 'register_class/register_class_page.dart';
import 'register_student/register_student_page.dart';
import 'register_subjects/register_subjects_page.dart';
import 'register_teacher/register_teacher_page.dart';
import 'school_report/school_report_page.dart';
import 'students_list_page/students_list_page.dart';

class AdminModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => HomeController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => HomePage(),
        ),
        ChildRoute('/students-list', child: (_, args) => StudentsListPage()),
        ChildRoute('/register', child: (_, args) => RegisterTeacherPage()),
        ChildRoute(
          '/profile',
          child: (_, args) => ProfilePage(
            name: args.data['name'],
          ),
        ),
        ChildRoute('/school-report', child: (_, args) => SchoolReportPage()),
        ChildRoute('/register-student',
            child: (_, args) => RegisterStudentPage()),
        ChildRoute('/config', child: (_, args) => ConfigPage()),
        ChildRoute('/register-teacher',
            child: (_, args) => RegisterTeacherPage()),
        ChildRoute('/register-subjects',
            child: (_, args) => RegisterSubjectsPage()),
        ChildRoute('/historic', child: (_, args) => HistoricPage()),
        ChildRoute('/register-class', child: (_, args) => RegisterClassPage()),
        ChildRoute('/register-manager',
            child: (_, args) => RegisterManagerPage()),
      ];
}
