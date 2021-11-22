import 'package:flutter_modular/flutter_modular.dart';
import 'login/login_screen.dart';
import 'register/register.dart';
import 'welcome/welcome.dart';

import 'forgot_password/forgot.dart';

class AuthModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => Welcome()),
        ChildRoute('/login', child: (_, args) => LoginScreen()),
        ChildRoute('/register', child: (_, args) => Register()),
        ChildRoute('/forgot', child: (_, args) => ForgotPasswordScreen()),
      ];
}
