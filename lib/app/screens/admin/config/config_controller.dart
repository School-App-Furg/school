import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/components/loader/loader_default.dart';
import '../../../core/models/cycle.dart';
import '../../../core/models/school_model.dart';
import '../../../core/service/snackbars.dart';
import '../admin_service.dart';
import '../home_page/home_controller.dart';

part 'config_controller.g.dart';

class ConfigController = _ConfigControllerBase with _$ConfigController;

abstract class _ConfigControllerBase with Store {
  //injeção de depencias da user admin
  String schoolId = Modular.get<HomeController>().userAdmin!.schoolId;

  GlobalKey<FormState> formKey = GlobalKey();
  AdminService _adminService = AdminService();

  @observable
  TextEditingController cycleName = TextEditingController();

  @action
  Future getCurrentCycle() async {
    loadingPage = true;

    schoolModel = await _adminService.getSchoolInformations(schoolId);
    cycle = await _adminService.getCurrentCycle(schoolModel!.currentCycle);
    cycleName.text = cycle!.name;
    cyclePeriod = cycle!.evaluationStandard;
    score = cycle!.approvalPattern;
    initialDate = DateTime.fromMillisecondsSinceEpoch(cycle!.initialDate);
    finalDate = DateTime.fromMillisecondsSinceEpoch(cycle!.finalDate);
    loadingPage = false;
  }

  @observable
  bool loadingPage = false;

  //configuração do padrão de avaliação

  List periodOptions = ['Bimestral', 'Trimestral'];

  @observable
  String cyclePeriod = '';

  @action
  setCyclePeriod(e) {
    cyclePeriod = e;
  }

  //configuração do periodo do ciclo

  @observable
  DateTime initialDate = DateTime(2022, 1, 9);

  @action
  setinitialDate(e) {
    if (e == null)
      initialDate = DateTime.now();
    else
      initialDate = e;
  }

  @observable
  DateTime finalDate = DateTime(2022, 1, 9);

  @action
  setFinalDate(e) {
    if (e == null)
      finalDate = DateTime.now();
    else
      finalDate = e;
  }

  //configuração de padrão de aprovação por nota
  List scoreList = ['60%', '70%'];

  @observable
  String score = '';

  @action
  setScore(e) {
    score = e;
  }

  @observable
  SchoolModel? schoolModel = SchoolModel(
    currentCycle: "",
    cnpj: "",
    name: '',
  );

  @observable
  Cycle? cycle = Cycle(
    name: "",
    idSchool: "",
    finalDate: DateTime.now().millisecondsSinceEpoch,
    initialDate: DateTime.now().millisecondsSinceEpoch,
    approvalPattern: '',
    evaluationStandard: '',
  );

  //função de atualização do ciclo
  update(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      final loader = LoaderDefault();
      try {
        loader.show();

        bool updatedCycle = await _adminService.updateCycle(
          schoolModel!.currentCycle,
          Cycle(
              name: cycleName.text,
              idSchool: schoolId,
              finalDate: finalDate.millisecondsSinceEpoch,
              initialDate: initialDate.millisecondsSinceEpoch,
              approvalPattern: score,
              evaluationStandard: cyclePeriod),
        );

        if (updatedCycle) {
          loader.hide();
          buildSnackBarUi(context, "Ciclo atualizado com sucesso!");
          Modular.to.pop();
        } else {
          loader.hide();
          buildSnackBarUi(context, "Seu ciclo não foi atualizado!");
        }
      } catch (e) {
        loader.hide();
        buildSnackBarUi(context, e.toString());
      }
    }
  }
}
