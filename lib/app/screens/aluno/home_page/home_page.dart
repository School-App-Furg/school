import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:school/app/core/components/classes_card.dart';
import 'package:school/app/core/components/loader/loader_page.dart';
import 'package:school/app/core/styles/colors.dart';

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
                  schoolModel: controller.schoolModel,
                ),
                appBar: AppBarHome(
                  onPressedDrawer: () =>
                      controller.scaffoldKey.currentState?.openDrawer(),
                  text: controller.schoolModel!.name,
                  onPressedHistoric: () => Modular.to.pushNamed('./historic'),
                  onPressedSubject: () =>
                      Modular.to.pushNamed('./register-class'),
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
                            child: Slidable(
                              endActionPane: ActionPane(
                                motion: ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) => Modular.to
                                        .pushNamed("./edit-class", arguments: {
                                      'class_year': controller.classes![index],
                                    }),
                                    backgroundColor: grey,
                                    foregroundColor: Colors.white,
                                    icon: Icons.edit,
                                    label: 'Editar',
                                  ),
                                  SlidableAction(
                                    onPressed: (context) {},
                                    backgroundColor: lightred,
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Excluir',
                                  ),
                                ],
                              ),
                              //Testes
                              child: ClassesCard(
                                assetimage: controller.definiBanner(index),
                                first: '${controller.subjects![index].name}',
                                second:
                                    'ID ${controller.subjects![index].schoolId}',
                                third: controller.subjects![index].name,
                                index: index,
                                onTap: () => Modular.to.pushNamed(
                                    "./students-list-class",
                                    arguments: {
                                      'Nome': controller.subjects![index]
                                    }),
                              ),
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
