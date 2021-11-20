import 'package:flutter_modular/flutter_modular.dart';
import 'package:school/app/screens/admin/config/config_page.dart';
import 'package:school/app/screens/admin/home_page/home_controller.dart';
import 'package:school/app/screens/admin/home_page/home_page.dart';
import 'package:school/app/screens/admin/profile/profile_page.dart';
import 'package:school/app/screens/admin/register_all_users/register_all_users_page.dart';
import 'package:school/app/screens/admin/register_subjects/register_subjects_page.dart';

import 'historic/historic_page.dart';

class AdminModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => HomeController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => HomePage()),
        ChildRoute('/register', child: (_, args) => RegisterAllUsersPage()),
        ChildRoute('/profile', child: (_, args) => ProfilePage()),
        ChildRoute('/config', child: (_, args) => ConfigPage()),
        ChildRoute('/register-all-users',
            child: (_, args) => RegisterAllUsersPage()),
        ChildRoute('/register-subjects',
            child: (_, args) => RegisterSubjectsPage()),
        ChildRoute('/historic', child: (_, args) => HistoricPage()),
      ];
}
