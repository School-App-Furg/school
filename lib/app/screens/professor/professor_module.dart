import 'package:flutter_modular/flutter_modular.dart';
import 'add_grades/add_grades_controller.dart';
import 'add_grades/add_grades_page.dart';
import 'historic/historic_controller.dart';

import 'edit_school_report/edit_school_report_controller.dart';
import 'edit_school_report/edit_school_report_page.dart';
import 'school_report/school_report_controller.dart';

import 'historic/historic_page.dart';

import 'home_page/home_controller.dart';
import 'home_page/home_page.dart';
import 'profile/profile_page.dart';

import 'school_report/school_report_page.dart';

class ProfessorModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => HomeController()),
        Bind.lazySingleton((i) => SchoolReportController()),
        Bind.lazySingleton((i) => EditSchoolReportController()),
        Bind.lazySingleton((i) => HistoricController()),
        Bind.lazySingleton((i) => AddGradesController())
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => HomePage()),
        ChildRoute('/profile-page',
            child: (_, args) =>
                ProfilePage(teacherUser: args.data['teacherUser'])),
        ChildRoute('/edit-report',
            child: (_, args) => EditSchoolReportPage(
                  cycle: args.data['cycle'],
                  modelTable: args.data['modelTable'],
                  studentId: args.data['studentId'],
                  classId: args.data['classId'],
                  cycleId: args.data['cycleId'],
                  gradeId: args.data['gradeId'],
                  subjectId: args.data['subjectId'],
                  teacherId: args.data['teacherId'],
                )),
        ChildRoute('/school-report',
            child: (_, args) => SchoolReportPage(
                classe: args.data['classe'],
                subjectTeacher: args.data['subjectTeacher'],
                cycle: args.data['cycle'])),
        ChildRoute('/historic',
            child: (_, args) => HistoricPage(
                schoolId: args.data['schoolId'], cycle: args.data['cycle'])),
        ChildRoute('/add-grades',
            child: (_, args) => AddGradesPage(
                  classe: args.data['classe'],
                  cycle: args.data['cycle'],
                  subjectTeacher: args.data['subjectTeacher'],
                  listOfStudents: args.data['listOfStudents'],
                  grades: args.data['grades'],
                ))
      ];
}
