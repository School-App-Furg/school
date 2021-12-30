import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'config_controller.g.dart';

class ConfigController = _ConfigControllerBase with _$ConfigController;

abstract class _ConfigControllerBase with Store {
  GlobalKey<FormState> formKey = GlobalKey();

  @observable
  TextEditingController? value;

  @action
  void setPeriodName() {
    value = value;
  }
}
