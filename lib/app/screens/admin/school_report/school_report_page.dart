import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: Text('Boletim'),
      ),
      body: SchoolReportList(),
      backgroundColor: lightGrey,
    );
  }
}
