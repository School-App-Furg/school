import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/components/loader/loader_page.dart';
import '../../../core/models/classes.dart';
import '../../../core/models/cycle.dart';
import '../../../core/styles/colors.dart';
import 'components/student_card.dart';
import 'students_list_for_class_controller.dart';

class StudentsListForClass extends StatefulWidget {
  final Classes classe;
  final Cycle cycle;
  const StudentsListForClass({
    Key? key,
    required this.classe,
    required this.cycle,
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
                backgroundColor: lightGrey,
                appBar: AppBar(
                  title: Text(
                    'Alunos',
                  ),
                ),
                body: Observer(
                  builder: (_) {
                    return controller.students.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: Text(
                              'Esta turma ainda não possui nenhum aluno cadastrado!',
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          )
                        : ListView.builder(
                            itemCount: controller.students.length,
                            itemBuilder: (_, index) {
                              final data = controller.students[index];
                              return StudentCard(
                                studentUser: data!,
                                onTap: () => Modular.to.pushNamed(
                                    './school-report',
                                    arguments: {
                                      'classe': widget.classe,
                                      'studentId': data.id,
                                      'cycle': widget.cycle
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
