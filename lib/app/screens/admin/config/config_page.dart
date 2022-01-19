import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/components/label_text.dart';

import '../../../core/components/loader/loader_page.dart';

import '../../../core/components/date.dart';
import '../../../core/components/rounded_dropdown.dart';
import '../../../core/form/general_form.dart';
import '../../../core/service/validators.dart';
import '../../../core/styles/sizes.dart';

import 'config_controller.dart';

class ConfigPage extends StatefulWidget {
  final String schoolId;
  const ConfigPage({
    Key? key,
    required this.schoolId,
  }) : super(key: key);
  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends ModularState<ConfigPage, ConfigController> {
  @override
  void initState() {
    super.initState();
    controller.getCurrentCycle();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return controller.loadingPage
            ? LoaderPage()
            : Scaffold(
                appBar: AppBar(
                  title: Text('Configurações da escola'),
                  actions: [
                    IconButton(
                        onPressed: () => Modular.to.pushNamed('./new-cycle'),
                        icon: Icon(Icons.add))
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: SingleChildScrollView(
                    child: Observer(
                      builder: (_) {
                        return Form(
                          key: controller.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LabelText(
                                text: 'Ciclo atual:',
                              ),
                              MyTextFormField(
                                hintText: "2020/1",
                                validator: validateEmpty,
                                isPassword: false,
                                keyboardType: TextInputType.text,
                                controller: controller.cycleName,
                              ),
                              LabelText(
                                text: 'Padrão de avaliação:',
                              ),
                              RoundedDropdown(
                                value: controller.cyclePeriod,
                                onChanged: controller.setCyclePeriod,
                                hint: "Selecione o regime escolar:",
                                items: controller.periodOptions
                                    .map<DropdownMenuItem<String>>(
                                  (e) {
                                    return DropdownMenuItem<String>(
                                      value: e,
                                      child: Text(e),
                                    );
                                  },
                                ).toList(),
                              ),
                              LabelText(
                                text: 'Período de postagem de notas:',
                              ),
                              Observer(
                                builder: (_) {
                                  return Row(
                                    children: [
                                      BasicDateTimeField(
                                        currentValue: controller.initialDate,
                                        hintText: "Data inicial",
                                        onChanged: controller.setinitialDate,
                                      ),
                                      BasicDateTimeField(
                                        currentValue: controller.finalDate,
                                        hintText: "Data final",
                                        onChanged: controller.setFinalDate,
                                      ),
                                    ],
                                  );
                                },
                              ),
                              LabelText(
                                text: 'Padrão de aprovação por nota:',
                              ),
                              RoundedDropdown(
                                value: controller.score,
                                onChanged: controller.setScore,
                                hint:
                                    "Selecione o padrão de aprovação por nota:",
                                items: controller.scoreList
                                    .map<DropdownMenuItem<String>>(
                                  (e) {
                                    return DropdownMenuItem<String>(
                                      value: e,
                                      child: Text(e),
                                    );
                                  },
                                ).toList(),
                              ),
                              LabelText(
                                text: 'Padrão de aprovação por presenças:',
                              ),
                              RoundedDropdown(
                                value: controller.attendance,
                                onChanged: controller.setAttendance,
                                hint:
                                    "Selecione o padrão de aprovação por presença:",
                                items: controller.attendanceList
                                    .map<DropdownMenuItem<String>>(
                                  (e) {
                                    return DropdownMenuItem<String>(
                                      value: e,
                                      child: Text(e),
                                    );
                                  },
                                ).toList(),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.blueAccent,
                                      minimumSize: Size(80, 50),
                                    ),
                                    onPressed: () {
                                      controller.update(context);
                                    },
                                    child: Text(
                                      'Atualizar',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width(context, .04),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
      },
    );
  }
}
