import 'package:flutter_modular/flutter_modular.dart';
import 'package:school/app/screens/gestor/config/config_page.dart';
import 'package:school/app/screens/gestor/edit_class/edit_class_page.dart';
import 'package:school/app/screens/gestor/edit_teacher/edit_teacher_page.dart';
import 'package:school/app/screens/gestor/historic/historic_page.dart';
import 'package:school/app/screens/gestor/profile/profile_page.dart';
import 'package:school/app/screens/gestor/register_class/register_class_page.dart';
import 'package:school/app/screens/gestor/register_managers/register_manager_page.dart';
import 'package:school/app/screens/gestor/register_student/register_student_page.dart';
import 'package:school/app/screens/gestor/register_subjects/register_subjects_page.dart';
import 'package:school/app/screens/gestor/register_teacher/register_teacher_page.dart';
import 'package:school/app/screens/gestor/school_report/school_report_page.dart';
import 'package:school/app/screens/gestor/students_list_page/students_list_page.dart';

import 'home_page/home_controller.dart';
import 'home_page/home_page.dart';

class GestorModule extends Module {
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
        ChildRoute(
          '/students-list',
          child: (_, args) => StudentsListPage(
            classe: args.data['classe'],
          ),
        ),
        ChildRoute(
          '/edit-class',
          child: (_, args) => EditClassPage(
            classes: args.data['class_year'],
          ),
        ),
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
        ChildRoute(
          '/edit-teacher',
          child: (_, args) => EditTeacherPage(
            teacherUser: args.data['teacher'],
          ),
        ),
        ChildRoute('/register-subjects',
            child: (_, args) => RegisterSubjectsPage()),
        ChildRoute('/historic', child: (_, args) => HistoricPage()),
        ChildRoute('/register-class', child: (_, args) => RegisterClassPage()),
        ChildRoute('/register-manager',
            child: (_, args) => RegisterManagerPage()),
      ];
}
