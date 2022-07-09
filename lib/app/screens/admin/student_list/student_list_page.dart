import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/components/loader/loader_page.dart';
import 'student_list_controller.dart';

class StudentListPage extends StatefulWidget {
  const StudentListPage({Key? key}) : super(key: key);

  @override
  State<StudentListPage> createState() => _StudentListPageState();
}

class _StudentListPageState
    extends ModularState<StudentListPage, StudentListController> {
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback(
      (_) {
        controller.getStudents(context);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return controller.loading == true
            ? LoaderPage()
            : Scaffold(
                appBar: AppBar(
                  title: Text('Alunos'),
                ),
                body: Observer(
                  builder: (_) {
                    return controller.students!.isEmpty
                        ? Center(
                            child: Text('Nenhum aluno cadastrado!'),
                          )
                        : ListView.builder(
                            itemCount: controller.students!.length,
                            itemBuilder: (_, index) {
                              final data = controller.students![index];
                              return Card(
                                child: ListTile(
                                  leading: Icon(Icons.person),
                                  title: Text(data.name),
                                ),
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
