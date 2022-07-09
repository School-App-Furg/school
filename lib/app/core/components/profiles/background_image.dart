import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 4,
      fit: BoxFit.cover,
      image: AssetImage("assets/images/background.jpg"),
    );
  }
}
