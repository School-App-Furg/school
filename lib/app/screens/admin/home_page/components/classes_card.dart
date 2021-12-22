import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/components/popup_menu.dart';
import '../home_controller.dart';

class ClassesCard extends StatefulWidget {
  const ClassesCard({
    Key? key,
    required this.controller,
    required this.index,
    this.onTap,
  }) : super(key: key);

  final HomeController controller;
  final int index;
  final Function()? onTap;

  @override
  State<ClassesCard> createState() => _ClassesCardState();
}

class _ClassesCardState extends State<ClassesCard> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return GestureDetector(
          onTap: widget.onTap,
          child: Stack(
            children: [
              Container(
                height: 140,
                //margin: const EdgeInsets.symmetric(vertical: 5.0),
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      widget.controller.definiBanner(widget.index),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.controller.classes![widget.index].level}º ano',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sala ${widget.controller.classes![widget.index].room}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          widget.controller.classes![widget.index].name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
