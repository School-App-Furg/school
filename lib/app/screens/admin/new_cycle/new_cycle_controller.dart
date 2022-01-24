import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/components/loader/loader_default.dart';
import '../../../core/models/cycle.dart';
import '../../../core/models/school_model.dart';
import '../../../core/service/snackbars.dart';
import '../admin_service.dart';
import '../config/config_controller.dart';
import '../home_page/home_controller.dart';

part 'new_cycle_controller.g.dart';

class NewCycleController = _NewCycleControllerBase with _$NewCycleController;

abstract class _NewCycleControllerBase with Store {
  //injeção de depencias da user admin
  String schoolId = Modular.get<HomeController>().userAdmin!.schoolId;

  GlobalKey<FormState> formKey = GlobalKey();
  AdminService _adminService = AdminService();

  String currentCycle = '';

  @observable
  TextEditingController cycleName = TextEditingController();

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
  DateTime initialDate = DateTime.now();

  @action
  setinitialDate(e) {
    if (e == null)
      initialDate = DateTime.now();
    else
      initialDate = e;
  }

  @observable
  DateTime finalDate = DateTime.now();

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

  //configuração de padrão de aprovação por presenças
  List attendanceList = ['60%', '70%'];

  @observable
  String attendance = '';

  @action
  setAttendance(e) {
    attendance = e;
  }

  @observable
  SchoolModel? schoolModel = SchoolModel(
    currentCycle: "",
    cnpj: "",
    name: '',
  );

  //função de cadastro do ciclo
  cadastrar(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      final loader = LoaderDefault();
      try {
        loader.show();

        //cadastra o primeiro ciclo com o docId igual o id do User , retorna true se tiver sido cadastrado
        String id = await _adminService.insertCycle(
          Cycle(
            name: cycleName.text,
            idSchool: schoolId,
            initialDate: initialDate.millisecondsSinceEpoch,
            finalDate: finalDate.millisecondsSinceEpoch,
            approvalPattern: score,
            evaluationStandard: cyclePeriod,
          ),
        );
        bool updateSchoolCycle =
            await _adminService.updateCycleSchool(id, schoolId);

        if (updateSchoolCycle) {
          loader.hide();
          buildSnackBarUi(context, "Ciclo cadastrado com sucesso!");
          Modular.get<ConfigController>().getCurrentCycle();
          Modular.to.pop();
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
