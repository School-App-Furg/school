import 'package:flutter/cupertino.dart';

double width(BuildContext context, double value) =>
    MediaQuery.of(context).size.width * value;

double height(BuildContext context, double value) =>
    MediaQuery.of(context).size.height * value;

double heightAll(context) => MediaQuery.of(context).size.height;
double widthAll(context) => MediaQuery.of(context).size.width;
