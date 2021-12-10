import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:school/app/core/styles/colors.dart';

class StudentsListView extends StatelessWidget {
  const StudentsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 17, left: 17, top: 3),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 17.0),
                      title: Text(
                        'Aluno #$index',
                        style: TextStyle(
                            color: darkGrey, fontWeight: FontWeight.bold),
                      ),
                      /*subtitle: Row(
                        children: [
                          Icon(
                            Icons.show_chart_rounded,
                            color: green,
                            //color: red,
                          ),
                          Text(" Nota média: $index",
                              style: TextStyle(color: grey))
                        ],
                      ),*/
                      leading: Container(
                        height: 40,
                        padding: EdgeInsets.only(right: 12.0),
                        child: Icon(Icons.person_rounded, color: blueicon),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right,
                          color: blueicon, size: 30.0),
                      onTap: () {
                        Modular.to.pushNamed('./school-report');
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
