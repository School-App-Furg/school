import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/styles/colors.dart';

import '../../../core/components/loader/loader_page.dart';
import '../../../core/form/general_form.dart';
import '../../../core/models/subject.dart';
import '../../../core/service/validators.dart';
import '../../../core/styles/sizes.dart';
import 'edit_subject_controller.dart';

class EditSubjectPage extends StatefulWidget {
  final Subject subject;
  const EditSubjectPage({
    Key? key,
    required this.subject,
  }) : super(key: key);
  @override
  State<EditSubjectPage> createState() => _EditSubjectPageState();
}

class _EditSubjectPageState
    extends ModularState<EditSubjectPage, EditSubjectController> {
  @override
  void initState() {
    super.initState();
    controller.initEditPage(widget.subject);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return controller.loading
            ? LoaderPage()
            : Scaffold(
                appBar: AppBar(
                  title: Text('Editar disciplina'),
                  centerTitle: true,
                ),
                body: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyTextFormField(
                        hintText: 'Disciplina',
                        controller: controller.nameController,
                        validator: validateEmpty,
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
