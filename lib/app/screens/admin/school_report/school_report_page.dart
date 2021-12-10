import 'package:flutter/material.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';
import 'package:school/app/core/styles/colors.dart';
import 'package:school/app/screens/admin/school_report/school_report_controller.dart';

import 'components/school_report_list.dart';

class SchoolReportPage extends StatefulWidget {
  @override
  State<SchoolReportPage> createState() => _SchoolReportPageState();
}

class _SchoolReportPageState extends State<SchoolReportPage> {
  final SchoolReportController _controller = SchoolReportController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Boletim'),
      ),
      body: SchoolReportList(),
      backgroundColor: lightGrey,
    );
  }
}
