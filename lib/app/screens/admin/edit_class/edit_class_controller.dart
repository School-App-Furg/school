import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/models/subject.dart';
import '../../../resources/auth_repository.dart';

part 'edit_class_controller.g.dart';

class EditClassController = _EditClassControllerBase with _$EditClassController;

abstract class _EditClassControllerBase with Store {
  GlobalKey<FormState> formKey = GlobalKey();
  User? user = Modular.get<AuthRepository>().usuario;
  TextEditingController roomController = TextEditingController();
  @observable
  List<Subject>? subjects = [];
}
