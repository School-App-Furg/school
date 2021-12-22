import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/components/loader/loader_page.dart';
import 'components/add_subject_dialog.dart';
import 'components/delete_dialog.dart';

import 'register_subjects_controller.dart';

class RegisterSubjectsPage extends StatefulWidget {
  @override
  State<RegisterSubjectsPage> createState() => _RegisterSubjectsPageState();
}

class _RegisterSubjectsPageState
    extends ModularState<RegisterSubjectsPage, RegisterSubjectsController> {
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
        return controller.subjects!.isEmpty
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
                body: ListView.builder(
                  itemCount: controller.subjects!.length,
                  itemBuilder: (_, index) {
                    var data = controller.subjects![index];
                    return Card(
                      child: ListTile(
                        title: Text(data.name),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () =>
                              showDeleteDialog(context, controller, data.id),
                        ),
                      ),
                    );
                  },
                ),
              );
      },
    );
  }
}
