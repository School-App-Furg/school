import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/components/loader/loader_page.dart';

import 'teacher_list_controller.dart';

class TeacherListPage extends StatefulWidget {
  @override
  State<TeacherListPage> createState() => _TeacherListPageState();
}

class _TeacherListPageState
    extends ModularState<TeacherListPage, TeacherListController> {
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback(
      (_) {
        controller.getTeachers(context);
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
                  title: Text('Professores'),
                ),
                body: Observer(
                  builder: (_) {
                    return controller.teachers!.length == 0
                        ? Center(
                            child: Text('Nenhum professor cadastrado!'),
                          )
                        : ListView.builder(
                            itemCount: controller.teachers!.length,
                            itemBuilder: (_, index) {
                              var data = controller.teachers![index];
                              return Card(
                                child: ListTile(
                                  leading: Icon(Icons.person),
                                  title: Text(data.name),
                                  trailing: IconButton(
                                    icon: Icon(Icons.settings),
                                    onPressed: () => Modular.to.pushNamed(
                                      './edit-teacher',
                                      arguments: {
                                        'teacher': data,
                                      },
                                    ),
                                  ),
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
