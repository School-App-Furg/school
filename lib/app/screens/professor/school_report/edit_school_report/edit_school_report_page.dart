import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../../../core/form/general_form.dart';
import '../../../../core/service/validators.dart';

class EditSchoolReportPage extends StatefulWidget {
  @override
  State<EditSchoolReportPage> createState() => _EditSchoolReportPageState();
}

class _EditSchoolReportPageState extends State<EditSchoolReportPage> {
  @override
  Widget build(BuildContext context) {
    var _controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Edição de Notas e Presenças'),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(18.0),
                child: DropdownSearch<String>(
                    mode: Mode.MENU,
                    items: ["1º Trimestre", "2º Trimestre", "3º Trimestre"],
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Selecione o período",
                    ),
                    popupItemDisabled: (String s) => s.startsWith('I'),
                    onChanged: print,
                    selectedItem: "1º Trimestre"),
              ),
              MyTextFormField(
                hintText: 'Nota final do 1º trimestre',
                controller: _controller,
                validator: validateEmpty,
                keyboardType: TextInputType.number,
              ),
              MyTextFormField(
                hintText: 'Total de faltas',
                controller: _controller,
                validator: validateEmpty,
                keyboardType: TextInputType.number,
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
