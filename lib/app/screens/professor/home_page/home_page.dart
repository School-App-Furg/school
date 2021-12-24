import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:school/app/core/components/classes_card.dart';
import 'package:school/app/core/components/loader/loader_page.dart';
import '../../../core/components/popup_menu.dart';
import '../drawer/drawer.dart';
import 'components/app_bar_home.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    super.initState();
    controller.initHome();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return controller.loading == true
            ? LoaderPage()
            : Scaffold(
                key: controller.scaffoldKey,
                drawerScrimColor: Colors.transparent,
                drawer: HomeDrawer(
                  teacherUser: controller.userAdmin,
                  schoolModel: controller.schoolModel,
                ),
                appBar: AppBarHome(
                  onPressedDrawer: () =>
                      controller.scaffoldKey.currentState?.openDrawer(),
                  text: controller.schoolModel!.name,
                  onPressedHistoric: () {},
                  onPressedSubject: () {},
                ),
                body: Observer(
                  builder: (_) {
                    return ListView.builder(
                      padding: EdgeInsets.all(10.0),
                      itemCount: controller.classes!.length,
                      itemBuilder: (context, int index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: ClassesCard(
                              assetimage: controller.definiBanner(index),
                              text_first:
                                  '${controller.classes![index].level}º ano',
                              text_second:
                                  'Sala ${controller.classes![index].room}',
                              text_third: controller.classes![index].name,
                              index: index,
                              onTap: () {},
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              );
      },
    );
  }
}
