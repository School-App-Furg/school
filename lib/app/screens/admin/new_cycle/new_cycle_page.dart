import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:school/app/core/styles/colors.dart';
import '../../../core/components/label_text.dart';
import '../../../core/components/date.dart';

import '../../../core/components/rounded_dropdown.dart';
import '../../../core/form/general_form.dart';
import '../../../core/service/validators.dart';
import '../../../core/styles/sizes.dart';

import 'new_cycle_controller.dart';

class NewCyclePage extends StatefulWidget {
  @override
  State<NewCyclePage> createState() => _NewCyclePageState();
}

class _NewCyclePageState
    extends ModularState<NewCyclePage, NewCycleController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar um novo ciclo'),
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
                      text: 'Nome do ciclo:',
                    ),
                    MyTextFormField(
                      hintText: "Exemplo: 2020/1",
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
                      text: 'Período de postagem/atualização de notas:',
                    ),
                    Row(
                      children: [
                        BasicDateTimeField(
                          hintText: "Data inicial",
                          onChanged: controller.setinitialDate,
                        ),
                        BasicDateTimeField(
                          hintText: "Data final",
                          onChanged: controller.setFinalDate,
                        ),
                      ],
                    ),
                    LabelText(
                      text: 'Padrão de aprovação por nota:',
                    ),
                    RoundedDropdown(
                      value: controller.score,
                      onChanged: controller.setScore,
                      hint: "Selecione o padrão de aprovação por nota:",
                      items: controller.scoreList.map<DropdownMenuItem<String>>(
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
                      hint: "Selecione o padrão de aprovação por presença:",
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
                            controller.cadastrar(context);
                          },
                          child: Text(
                            'Cadastrar',
                            style: TextStyle(
                              color: defaultWhite,
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
  }
}
