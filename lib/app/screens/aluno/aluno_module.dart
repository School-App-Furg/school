import 'package:flutter_modular/flutter_modular.dart';

import 'historic/historic_page.dart';
import 'home_page/home_controller.dart';
import 'home_page/home_page.dart';
import 'perfil/perfil_page.dart';
import 'student_report/student_report_page.dart';

class AlunoModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => HomeController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => HomePage()),
        ChildRoute('/student-report', child: (_, args) => StudentReportPage()),
        ChildRoute('/historic', child: (_, args) => HistoricPage()),
        ChildRoute('/profile',
            child: (_, args) =>
                PerfilPage(studentModel: args.data['studentModel'])),
      ];
}
