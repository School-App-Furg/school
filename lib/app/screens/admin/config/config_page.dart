import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:school/app/core/components/date.dart';

import 'package:school/app/core/form/general_form.dart';
import 'package:school/app/core/service/validators.dart';
import 'components/textfield_mask.dart';
import 'config_controller.dart';

class ConfigPage extends StatefulWidget {
  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  final ConfigController _controller = ConfigController();
  final Function dataInicioFimCiclo = () {};
  DateTime? ini;
  DateTime? fim;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: SingleChildScrollView(
        child: Observer(
          builder: (_) {
            return Form(
              key: _controller.formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: DropdownSearch<String>(
                      mode: Mode.MENU,
                      items: ["Bimestre", "Trimestre"],
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Selecione o regime escolar:",
                        labelStyle: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      onChanged: (value) => _controller.cyclePeriodController,
                      validator: validateEmptyMultiSelect,
                    ),
                  ),
                  MyTextFormField(
                    labelText: "Nome do bimestre/trimestre",
                    hintText: "Bimestre A",
                    validator: validateEmpty,
                    isPassword: false,
                    keyboardType: TextInputType.text,
                    controller: _controller.cycleNameController,
                  ),
                  Text("Início do período:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                          fontSize: 14.0)),
                  BasicDateTimeField(
                    hintText: "Selecione o início do período",
                    onChange: (value) {
                      ini = value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Limite postagem de notas:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                          fontSize: 14.0)),
                  BasicDateTimeField(
                    hintText: "Selecione o limite p/ postagem de notas",
                    onChange: (value) {
                      fim = value;
                    },
                  ),
                  MaskTextField(
                    hintText: "70,00",
                    labelText: "Condição para aprovação (nota mínima) em %",
                    controller: _controller.cycleLeastScoreController,
                  ),
                  MaskTextField(
                    hintText: "85,00",
                    labelText: "Presenças mínima para aprovação em %",
                    controller: _controller.cycleLeastAttendanceController,
                  ),
                  SizedBox(height: 5),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      /*padding: EdgeInsets.only(
                          left: 25, right: 25, bottom: 15, top: 15),*/
                      primary: Colors.blueAccent,
                    ),
                    onPressed: () {
                      _controller.cadastrar(context);
                      dataInicioFimCiclo(ini, fim);
                    },
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
