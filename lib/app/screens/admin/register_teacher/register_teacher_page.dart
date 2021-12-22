import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/components/loader/loader_page.dart';

import 'components/add_teacher_dialog.dart';
import 'components/delete_dialog.dart';
import 'register_teacher_controller.dart';

class RegisterTeacherPage extends StatefulWidget {
  @override
  State<RegisterTeacherPage> createState() => _RegisterTeacherPageState();
}

class _RegisterTeacherPageState extends State<RegisterTeacherPage> {
  final RegisterTeacherController _controller = RegisterTeacherController();

  @override
  void initState() {
    super.initState();
    _controller.getSubjects();
    WidgetsBinding.instance?.addPostFrameCallback(
      (_) {
        _controller.getTeachers(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return _controller.teachers!.isEmpty
            ? LoaderPage()
            : Scaffold(
                appBar: AppBar(
                  title: Text('Professores'),
                  actions: [
                    IconButton(
                      onPressed: () =>
                          showAddTeacherDialog(context, _controller),
                      icon: Icon(Icons.add),
                    )
                  ],
                ),
                body: ListView.builder(
                  itemCount: _controller.teachers!.length,
                  itemBuilder: (_, index) {
                    var data = _controller.teachers![index];
                    return Card(
                      child: ListTile(
                        title: Text(data.name),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () =>
                              showDeleteDialog(context, _controller, data.id),
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
