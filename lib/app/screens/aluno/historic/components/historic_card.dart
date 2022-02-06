import 'package:flutter/material.dart';

import '../../../../core/components/cycle_period.dart';
import '../../../../core/models/cycle.dart';
import '../historic_controller.dart';

class HistoricCard extends StatelessWidget {
  final Cycle cycle;
  final Function()? onTap;
  final HistoricController controller;
  const HistoricCard({
    Key? key,
    required this.cycle,
    this.onTap,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: ListTile(
          title: Row(
            children: [
              CyclePeriod(
                label: cycle.name,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "${controller.convertDate(cycle.initialDate)} até ${controller.convertDate(cycle.finalDate)}",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          trailing: Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
