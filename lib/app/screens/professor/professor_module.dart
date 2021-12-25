import 'package:flutter_modular/flutter_modular.dart';
import 'package:school/app/screens/professor/school_report/school_report_page.dart';
import 'package:school/app/screens/professor/students_list_page/students_list_page.dart';

import 'home_page/home_controller.dart';
import 'home_page/home_page.dart';
import 'school_report/edit_school_report/edit_school_report_page.dart';

class ProfessorModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => HomeController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => HomePage()),
        ChildRoute('/edit-report', child: (_, args) => EditSchoolReportPage()),
        ChildRoute('/school-report', child: (_, args) => SchoolReportPage()),
        ChildRoute('/students-list', child: (_, args) => StudentsListPage()),
      ];
}
