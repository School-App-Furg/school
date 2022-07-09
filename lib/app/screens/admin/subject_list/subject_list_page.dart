import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/components/loader/loader_page.dart';
import 'components/add_subject_dialog.dart';
import 'subject_list_controller.dart';

class SubjectsListPage extends StatefulWidget {
  const SubjectsListPage({Key? key}) : super(key: key);

  @override
  State<SubjectsListPage> createState() => _SubjectsListPageState();
}

class _SubjectsListPageState
    extends ModularState<SubjectsListPage, SubjectsListController> {
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback(
      (_) {
        controller.getSubjects(context);
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
                  title: Text('Disciplinas'),
                  actions: [
                    IconButton(
                      onPressed: () =>
                          showAddSubjectDialog(context, controller),
                      icon: Icon(Icons.add),
                    )
                  ],
                ),
                body: Observer(
                  builder: (_) {
                    return controller.subjects!.isEmpty
                        ? Center(
                            child: Text('Nenhuma disciplina cadastrada!'),
                          )
                        : ListView.builder(
                            itemCount: controller.subjects!.length,
                            itemBuilder: (_, index) {
                              final data = controller.subjects![index];
                              return Card(
                                child: ListTile(
                                  title: Text(data.name),
                                  trailing: IconButton(
                                    icon: Icon(Icons.settings),
                                    onPressed: () => Modular.to.pushNamed(
                                      './edit-subject',
                                      arguments: {
                                        'subject': data,
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
