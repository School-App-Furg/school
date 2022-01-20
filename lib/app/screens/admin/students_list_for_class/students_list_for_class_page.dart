import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/components/loader/loader_page.dart';

import '../../../core/models/classes.dart';
import 'components/student_card.dart';
import 'students_list_for_class_controller.dart';

class StudentsListForClass extends StatefulWidget {
  final Classes classe;
  const StudentsListForClass({
    Key? key,
    required this.classe,
  }) : super(key: key);

  @override
  State<StudentsListForClass> createState() => _StudentsListForClassState();
}

class _StudentsListForClassState
    extends ModularState<StudentsListForClass, StudentsListForClassController> {
  @override
  void initState() {
    super.initState();
    controller.initPage(context, widget.classe);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return controller.loading
            ? LoaderPage()
            : Scaffold(
                appBar: AppBar(
                  title: Text(
                    'Alunos',
                  ),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.receipt_sharp),
                      onPressed: () {},
                    ),
                  ],
                ),
                body: Observer(
                  builder: (_) {
                    return controller.students.length == 0
                        ? Center(
                            child: Text(
                                'Esta turma ainda não possui nenhum aluno cadastrado!'),
                          )
                        : ListView.builder(
                            padding: EdgeInsets.only(top: 10),
                            itemCount: controller.students.length,
                            itemBuilder: (_, index) {
                              var data = controller.students[index];
                              return StudentCard(
                                studentUser: data!,
                                onTap: () =>
                                    Modular.to.pushNamed('./school-report',
                                        arguments: {
                                          'classe': widget.classe,
                                          'studentId': data.id,
                                        },
                                        forRoot: true),
                              );
                            },
                          );
                  },
                ),
              );
      },
    );
  }
}
