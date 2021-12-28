import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'config_controller.dart';

class ConfigPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(18.0),
                child: DropdownSearch<String>(
                    mode: Mode.MENU,
                    items: ["Bimestre", "Trimestre"],
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Selecione o regime escolar",
                      labelStyle: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    onChanged: print,
                    selectedItem: "Bimestre"),
              ),
              //Considerando que o admin pode cadastrar um bimestre/trimestre
              //num determinado mês qualquer, é melhor deixar um prazo fixo de dias
              //pra limite da postagem das notas, q contabilizam após finalizar
              // o regime escolar definido.
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Limite para postagem de notas (em dias) após término do regime escolar',
                      style: TextStyle(fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    SfSlider(
                        min: 0.0,
                        max: 50.0,
                        value: 15.0,
                        interval: 5,
                        showTicks: true,
                        showLabels: true,
                        enableTooltip: true,
                        minorTicksPerInterval: 1,
                        onChanged: (dynamic value) {}),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Condição para aprovação (em %)',
                      style: TextStyle(fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    SfSlider(
                        inactiveColor: Colors.green,
                        activeColor: Colors.blue,
                        min: 0.0,
                        max: 100.0,
                        value: 70.0,
                        interval: 20,
                        showTicks: true,
                        showLabels: true,
                        enableTooltip: true,
                        minorTicksPerInterval: 1,
                        onChanged: (dynamic value) {}),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Presenças mínimas para aprovação (com base na quantidade total de dias letivos, em %)',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SfSlider(
                        inactiveColor: Colors.green,
                        activeColor: Colors.blue,
                        min: 0.0,
                        max: 100.0,
                        value: 70.0,
                        interval: 20,
                        showTicks: true,
                        showLabels: true,
                        enableTooltip: true,
                        minorTicksPerInterval: 1,
                        onChanged: (dynamic value) {}),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                ),
                onPressed: () {},
                child: Text(
                  'Cadastrar',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
