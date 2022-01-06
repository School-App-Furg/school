import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:school/app/core/components/app_bar_report.dart';

import '../../../core/styles/colors.dart';
import 'components/school_report_list.dart';

class SchoolReportPage extends StatefulWidget {
  @override
  State<SchoolReportPage> createState() => _SchoolReportPageState();
}

class _SchoolReportPageState extends State<SchoolReportPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarReport(
        textButton: "Gerar Boletim Aluno",
        onPressed: () {},
        text: 'Boletim',
        onPressedHistoric: () => Modular.to.pushNamed('./historic'),
        onPressedSubject: () => Modular.to.pushNamed('./register-class'),
      ),
      body: SchoolReportList(),
      backgroundColor: lightGrey,
    );
  }
}
