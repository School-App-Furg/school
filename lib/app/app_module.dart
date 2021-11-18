import 'package:flutter_modular/flutter_modular.dart';

import 'screens/admin/admin_module.dart';
import 'screens/auth/auth_module.dart';
import 'screens/auth/splash/splash_screen.dart';
import 'screens/repository/auth_repository.dart';
import 'screens/repository/user_repository.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => AuthRepository()),
        Bind.lazySingleton((i) => UsersRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => Splash()),
        ModuleRoute('/auth', module: AuthModule()),
        ModuleRoute('/admin', module: AdminModule())
      ];
}
