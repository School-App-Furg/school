import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:school/app/core/models/teacher_user.dart';

import '../../../core/components/loader/loader_page.dart';
import 'components/add_teacher_dialog.dart';

import 'register_teacher_controller.dart';

class RegisterTeacherPage extends StatefulWidget {
  @override
  State<RegisterTeacherPage> createState() => _RegisterTeacherPageState();
}

class _RegisterTeacherPageState
    extends ModularState<RegisterTeacherPage, RegisterTeacherController> {
  @override
  void initState() {
    super.initState();
    controller.getSubjects();
    WidgetsBinding.instance?.addPostFrameCallback(
      (_) {
        controller.getTeachers(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return controller.teachers!.isEmpty
            ? LoaderPage()
            : Scaffold(
                appBar: AppBar(
                  title: Text('Professores'),
                  actions: [
                    IconButton(
                      onPressed: () =>
                          showAddTeacherDialog(context, controller),
                      icon: Icon(Icons.add),
                    )
                  ],
                ),
                body: ListView.builder(
                  itemCount: controller.teachers!.length,
                  itemBuilder: (_, index) {
                    TeacherUser data = controller.teachers![index];
                    return Card(
                      child: ListTile(
                        title: Text(data.name),
                        trailing: IconButton(
                          icon: Icon(Icons.settings),
                          onPressed: () => Modular.to.pushNamed(
                              './edit-teacher',
                              arguments: {'teacher': data},
                              forRoot: true),
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
