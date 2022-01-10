import 'package:flutter_modular/flutter_modular.dart';

import 'home_page/home_controller.dart';
import 'home_page/home_page.dart';
import 'profile/profile_page.dart';
import 'school_report/edit_school_report/edit_school_report_page.dart';
import 'school_report/school_report_page.dart';
import 'students_list_page/students_list_page.dart';

class ProfessorModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => HomeController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => HomePage()),
        ChildRoute('/profile-page',
            child: (_, args) =>
                ProfilePage(teacherModel: args.data['teacherModel'])),
        ChildRoute('/edit-report', child: (_, args) => EditSchoolReportPage()),
        ChildRoute('/school-report', child: (_, args) => SchoolReportPage()),
        ChildRoute('/students-list', child: (_, args) => StudentsListPage()),
      ];
}
