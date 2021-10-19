import 'package:flutter/material.dart';

void navigateToLoginPage(BuildContext context) {
  Navigator.of(context).pushNamed('/login');
}

void navigateToHomePage(BuildContext context) {
  Navigator.of(context).pushNamed('/home');
}

//void navigateToOfferDetail(BuildContext context, HouseOfferModel model) {
//  Navigator.of(context).pushNamed('/offerDetail', arguments: model);
//}