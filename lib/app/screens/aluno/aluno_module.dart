import 'package:flutter_modular/flutter_modular.dart';

import 'historic/historic_controller.dart';
import 'historic/historic_page.dart';
import 'home_page/home_controller.dart';
import 'home_page/home_page.dart';
import 'perfil/perfil_page.dart';
import 'student_report/student_report_controller.dart';
import 'student_report/student_report_page.dart';

class AlunoModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => HomeController()),
        Bind.lazySingleton((i) => StudentReportController()),
        Bind.lazySingleton((i) => HistoricController())
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => HomePage()),
        ChildRoute('/student-report',
            child: (_, args) => StudentReportPage(
                subjectTeacher: args.data['subjectTeacher'],
                studentId: args.data['studentId'],
                cycle: args.data['cycle'])),
        ChildRoute('/historic',
            child: (_, args) => HistoricPage(
                schoolId: args.data['schoolId'], cycle: args.data['cycle'])),
        ChildRoute('/profile',
            child: (_, args) =>
                PerfilPage(studentModel: args.data['studentModel'])),
      ];
}
