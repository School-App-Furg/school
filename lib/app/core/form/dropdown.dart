import 'package:flutter/material.dart';

class MyDropDown extends StatelessWidget {
  final String value;
  final List<String> lista;
  final Function(String?) onchanged;
  const MyDropDown({
    Key? key,
    required this.value,
    required this.lista,
    required this.onchanged,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: DropdownButton<String>(
        underline: SizedBox(),
        value: value,
        style: TextStyle(color: Colors.black),
        items: lista.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onchanged,
      ),
    );
  }
}
