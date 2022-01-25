import 'package:flutter_modular/flutter_modular.dart';
import 'school_report/school_report_controller.dart';

import 'config/config_controller.dart';
import 'config/config_page.dart';
import 'edit_class/edit_class_controller.dart';
import 'edit_class/edit_class_page.dart';
import 'edit_subject/edit_subject_controller.dart';
import 'edit_subject/edit_subject_page.dart';
import 'edit_teacher/edit_teacher_controller.dart';
import 'edit_teacher/edit_teacher_page.dart';
import 'historic/historic_page.dart';
import 'home_page/home_controller.dart';
import 'home_page/home_page.dart';
import 'new_cycle/new_cycle_controller.dart';
import 'new_cycle/new_cycle_page.dart';
import 'profile/profile_page.dart';
import 'register_class/register_class_controller.dart';
import 'register_class/register_class_page.dart';
import 'school_report/school_report_page.dart';

import 'student_list/student_list_controller.dart';
import 'student_list/student_list_page.dart';
import 'students_list_for_class/students_list_for_class_controller.dart';
import 'students_list_for_class/students_list_for_class_page.dart';
import 'subject_list/subject_list_controller.dart';
import 'subject_list/subject_list_page.dart';
import 'teacher_list/teacher_list_controller.dart';
import 'teacher_list/teacher_list_page.dart';

class AdminModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => HomeController()),
        Bind.lazySingleton((i) => SubjectsListController()),
        Bind.lazySingleton((i) => TeacherListController()),
        Bind.lazySingleton((i) => StudentListController()),
        Bind.lazySingleton((i) => EditTeacherController()),
        Bind.lazySingleton((i) => ConfigController()),
        Bind.lazySingleton((i) => NewCycleController()),
        Bind.lazySingleton((i) => EditClassController()),
        Bind.lazySingleton((i) => RegisterClassController()),
        Bind.lazySingleton((i) => EditSubjectController()),
        Bind.lazySingleton((i) => StudentsListForClassController()),
        Bind.lazySingleton((i) => SchoolReportController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => HomePage(),
        ),
        ChildRoute('/students-list-class',
            child: (_, args) =>
                StudentsListForClass(classe: args.data['classe'])),
        ChildRoute('/teachers-list', child: (_, args) => TeacherListPage()),
        ChildRoute('/students-list', child: (_, args) => StudentListPage()),
        ChildRoute('/edit-class',
            child: (_, args) =>
                EditClassPage(classes: args.data['class_year'])),
        ChildRoute('/profile',
            child: (_, args) =>
                ProfilePage(schoolModel: args.data['schoolModel'])),
        ChildRoute('/school-report',
            child: (_, args) => SchoolReportPage(
                  classe: args.data['classe'],
                  studentId: args.data['studentId'],
                )),
        ChildRoute('/config',
            child: (_, args) => ConfigPage(schoolId: args.data['schoolId'])),
        ChildRoute('/new-cycle', child: (_, args) => NewCyclePage()),
        ChildRoute('/edit-teacher',
            child: (_, args) =>
                EditTeacherPage(teacherUser: args.data['teacher'])),
        ChildRoute('/subjects-list', child: (_, args) => SubjectsListPage()),
        ChildRoute('/edit-subject',
            child: (_, args) => EditSubjectPage(subject: args.data['subject'])),
        ChildRoute('/historic', child: (_, args) => HistoricPage()),
        ChildRoute('/register-class', child: (_, args) => RegisterClassPage()),
      ];
}
