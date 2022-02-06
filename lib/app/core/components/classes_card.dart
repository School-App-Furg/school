import 'package:flutter/material.dart';

import '../styles/colors.dart';

class ClassesCard extends StatefulWidget {
  const ClassesCard({
    Key? key,
    required this.index,
    this.onTap,
    required this.first,
    required this.second,
    required this.third,
    required this.assetimage,
  }) : super(key: key);

  final int index;
  final Function()? onTap;
  final String first;
  final String second;
  final String third;
  final String assetimage;

  @override
  State<ClassesCard> createState() => _ClassesCardState();
}

class _ClassesCardState extends State<ClassesCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Stack(
        children: [
          Container(
            height: 140,
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
                      widget.first,
                      style: const TextStyle(
                        color: defaultWhite,
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
                      widget.second,
                      style: const TextStyle(
                        color: defaultWhite,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      widget.third,
                      style: const TextStyle(
                        color: defaultWhite,
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
  }
}
