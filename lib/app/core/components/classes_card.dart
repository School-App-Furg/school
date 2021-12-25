import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'popup_menu.dart';
import '../../screens/admin/home_page/home_controller.dart';

class ClassesCard extends StatefulWidget {
  const ClassesCard({
    Key? key,
    required this.index,
    this.onTap,
    required this.text_first,
    required this.text_second,
    required this.text_third,
    required this.assetimage,
  }) : super(key: key);

  final int index;
  final Function()? onTap;
  final String text_first;
  final String text_second;
  final String text_third;
  final String assetimage;

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
                      widget.assetimage,
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
                          widget.text_first,
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
                          widget.text_second,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          widget.text_third,
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
