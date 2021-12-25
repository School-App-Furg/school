import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:school/app/core/form/general_form.dart';
import 'package:school/app/core/form/multi_select.dart';

import 'package:school/app/core/models/teacher_user.dart';
import 'package:school/app/core/service/validators.dart';

import 'components/delete_dialog.dart';
import 'edit_teacher_controller.dart';

class EditTeacherPage extends StatefulWidget {
  final TeacherUser teacherUser;
  const EditTeacherPage({
    Key? key,
    required this.teacherUser,
  }) : super(key: key);
  @override
  State<EditTeacherPage> createState() => _EditTeacherPageState();
}

class _EditTeacherPageState
    extends ModularState<EditTeacherPage, EditTeacherController> {
  @override
  void initState() {
    super.initState();
    controller.initEditPage(widget.teacherUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar professor'),
        actions: [
          IconButton(
            onPressed: () => showDeleteTeacherDialog(
                context, controller, widget.teacherUser.id),
            icon: Icon(Icons.delete),
          )
        ],
      ),
      body: Form(
        key: controller.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyTextFormField(
              hintText: 'Nome completo',
              controller: controller.nameController,
              validator: validateEmpty,
            ),
            Observer(
              builder: (_) {
                return MultiSelect(
                  buttonText: "Selecione as disciplinas:",
                  title: "Selecione as disciplinas:",
                  items: controller.listOfsubjects!
                      .map((e) => MultiSelectItem(e, e.name))
                      .toList(),
                  onConfirm: controller.setSubjectsSelected,
                  initialValue: [
                    controller.listOfsubjects!.toList(),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
