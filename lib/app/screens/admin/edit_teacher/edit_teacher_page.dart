import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../../../core/components/loader/loader_page.dart';
import '../../../core/form/general_form.dart';
import '../../../core/form/multi_select.dart';
import '../../../core/models/teacher_user.dart';
import '../../../core/service/validators.dart';
import '../../../core/styles/colors.dart';
import '../../../core/styles/sizes.dart';
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
    return Observer(
      builder: (_) {
        return controller.loading
            ? LoaderPage()
            : Scaffold(
                appBar: AppBar(
                  title: Text('Editar professor'),
                  centerTitle: true,
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
                            initialValue: controller.listOfSubjectsSelected,
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blueAccent,
                              minimumSize: Size(80, 50),
                            ),
                            onPressed: () {
                              controller.update(context);
                            },
                            child: Text(
                              'Atualizar',
                              style: TextStyle(
                                color: defaultWhite,
                                fontSize: width(context, .04),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
