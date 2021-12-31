import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:school/app/core/components/loader/loader_default.dart';
import 'package:school/app/core/models/cycle.dart';
import 'package:school/app/core/models/school_model.dart';
import 'package:school/app/core/service/snackbars.dart';
import 'package:school/app/screens/admin/home_page/home_controller.dart';
import 'package:school/app/screens/auth/auth_service.dart';

import '../admin_service.dart';

part 'config_controller.g.dart';

class ConfigController = _ConfigControllerBase with _$ConfigController;

abstract class _ConfigControllerBase with Store {
  GlobalKey<FormState> formKey = GlobalKey();
  AuthService _authService = AuthService();
  AdminService adminService = AdminService();
  User? user;
  TextEditingController cycleNameController = TextEditingController();
  TextEditingController cycleLeastScoreController = TextEditingController();
  TextEditingController cycleLeastAttendanceController =
      TextEditingController();
  TextEditingController cyclePeriodController = TextEditingController();
  //injeção de depencias da user admin
  String schoolId = Modular.get<HomeController>().userAdmin!.schoolId;

  @observable
  SchoolModel? schoolModel = SchoolModel(
      currentCycle: "",
      cnpj: "",
      closingDate: DateTime.now(),
      logo: '',
      name: '',
      regime: 0);

  @observable
  Cycle? cycle = Cycle(
      name: "",
      finalDate: DateTime.now(),
      idSchool: "",
      initialDate: DateTime.now());

  @action

  //função de cadastro do ciclo
  cadastrar(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      final loader = LoaderDefault();
      try {
        loader.show();

        //cadastra o primeiro ciclo com o docId igual o id do User , retorna true se tiver sido cadastrado
        bool insertedCycle = await _authService.insertCycleSchool(
          user!.uid,
          Cycle(
            name: cycleNameController.text,
            idSchool: schoolId,
            //***A FAZER*** -> Retornar os valores inseridos dos períodos do ciclo
            initialDate: DateTime.now(),
            finalDate: DateTime.now(),
          ),
        );

        if (insertedCycle) {
          cyclePeriodController.clear();
          cycleLeastScoreController.clear();
          cycleLeastAttendanceController.clear();
          loader.hide();
          buildSnackBarUi(context, "Ciclo cadastrado com sucesso!");
          Modular.to.pushReplacementNamed("/admin/");
        } else {
          loader.hide();
          buildSnackBarUi(context, "Seu ciclo não foi cadastrado!");
        }
      } catch (e) {
        loader.hide();
        buildSnackBarUi(context, e.toString());
      }
    }
  }
}
