import 'package:flutter_modular/flutter_modular.dart';
import 'package:school/app/screens/admin/home_page/home_controller.dart';
import 'package:school/app/screens/admin/home_page/home_page.dart';

class GestorModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => HomeController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => HomePage()),
      ];
}
