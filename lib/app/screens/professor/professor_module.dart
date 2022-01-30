import 'package:flutter_modular/flutter_modular.dart';

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
                subjectTeacher: args.data['subjectTeacher'])),
        ChildRoute('/historic', child: (_, args) => HistoricPage()),
      ];
}
