import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class LoaderDefault {
  final entry = OverlayEntry(
    builder: (context) {
      return Container(
        decoration: const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
        child: const Center(
          child: CircularProgressIndicator(
            color: blue,
          ),
        ),
      );
    },
  );

  void show() {
    asuka.addOverlay(entry);
  }

  void hide() {
    entry.remove();
  }
}
