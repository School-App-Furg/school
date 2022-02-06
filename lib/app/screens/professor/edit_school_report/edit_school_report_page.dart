import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../core/components/label_text.dart';
import '../../../core/components/rounded_label.dart';
import '../../../core/form/general_form.dart';
import '../../../core/models/cycle.dart';
import '../../../core/models/model_table.dart';
import '../../../core/service/validators.dart';
import '../../../core/styles/colors.dart';
import '../../../core/styles/sizes.dart';
import 'edit_school_report_controller.dart';

class EditSchoolReportPage extends StatefulWidget {
  final Cycle cycle;
  final ModelTable modelTable;
  final String studentId;
  final String cycleId;
  final String subjectId;
  final String teacherId;
  final String classId;
  final String gradeId;
  const EditSchoolReportPage({
    Key? key,
    required this.cycle,
    required this.modelTable,
    required this.studentId,
    required this.cycleId,
    required this.subjectId,
    required this.teacherId,
    required this.classId,
    required this.gradeId,
  }) : super(key: key);
  @override
  State<EditSchoolReportPage> createState() => _EditSchoolReportPageState();
}

class _EditSchoolReportPageState
    extends ModularState<EditSchoolReportPage, EditSchoolReportController> {
  @override
  void initState() {
    controller.initEditSchoolReport(widget.cycle, widget.modelTable);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var maskFormatterFaults = new MaskTextInputFormatter(
      mask: '##',
      filter: {"#": RegExp(r'[0-9]')},
    );
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Edição de Notas e Presenças'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: RoundedLabel(
                        value: controller.period,
                      ),
                    ),
                    LabelText(
                      text: 'Nota final:',
                    ),
                    MyTextFormField(
                      mask: [
                        (FilteringTextInputFormatter.allow(
                            RegExp(r'[0-9.]{0,4}$'))),
                      ],
                      hintText: 'Insira a nota',
                      controller: controller.noteController,
                      validator: validateNote10,
                      keyboardType: TextInputType.number,
                    ),
                    LabelText(
                      text: 'Total de faltas:',
                    ),
                    MyTextFormField(
                      mask: [maskFormatterFaults],
                      hintText: 'Insira as faltas',
                      controller: controller.faultsController,
                      validator: validateEmpty,
                      keyboardType: TextInputType.number,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: widget.modelTable.nota == '-'
                              ? ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blueAccent,
                                    minimumSize: Size(80, 50),
                                  ),
                                  onPressed: () {
                                    controller.insert(
                                        context,
                                        widget.studentId,
                                        widget.cycleId,
                                        widget.subjectId,
                                        widget.teacherId,
                                        widget.classId);
                                  },
                                  child: Text(
                                    'Cadastrar',
                                    style: TextStyle(
                                      color: defaultWhite,
                                      fontSize: width(context, .04),
                                    ),
                                  ),
                                )
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blueAccent,
                                    minimumSize: Size(80, 50),
                                  ),
                                  onPressed: () {
                                    controller.update(context, widget.gradeId);
                                  },
                                  child: Text(
                                    'Atualizar',
                                    style: TextStyle(
                                      color: defaultWhite,
                                      fontSize: width(context, .04),
                                    ),
                                  ),
                                )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
