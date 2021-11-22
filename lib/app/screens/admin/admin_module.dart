import 'package:flutter_modular/flutter_modular.dart';
import 'config/config_page.dart';
import 'home_page/home_controller.dart';
import 'home_page/home_page.dart';
import 'profile/profile_page.dart';
import 'register_all_users/register_all_users_page.dart';
import 'register_class/register_class_page.dart';
import 'register_subjects/register_subjects_page.dart';

import 'historic/historic_page.dart';

class AdminModule extends Module {
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
        ChildRoute('/register', child: (_, args) => RegisterAllUsersPage()),
        ChildRoute(
          '/profile',
          child: (_, args) => ProfilePage(
            name: args.data['name'],
          ),
        ),
        ChildRoute('/config', child: (_, args) => ConfigPage()),
        ChildRoute('/register-all-users',
            child: (_, args) => RegisterAllUsersPage()),
        ChildRoute('/register-subjects',
            child: (_, args) => RegisterSubjectsPage()),
        ChildRoute('/historic', child: (_, args) => HistoricPage()),
        ChildRoute('/register-class', child: (_, args) => RegisterClassPage()),
      ];
}
