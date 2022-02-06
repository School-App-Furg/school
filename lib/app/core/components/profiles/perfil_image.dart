import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class PerfilImage extends StatelessWidget {
  final AssetImage image;
  const PerfilImage({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(top: 120), //10
            height: 140, //140
            width: 140,
            decoration: BoxDecoration(
              color: defaultWhite,
              shape: BoxShape.circle,
              border: Border.all(
                color: defaultWhite,
                width: 4, //8
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: image,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
