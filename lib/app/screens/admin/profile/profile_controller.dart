import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  TextEditingController emailController = TextEditingController();
  TextEditingController cnpjController = TextEditingController();
  TextEditingController cycleName = TextEditingController();
}
