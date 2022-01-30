import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/components/classes_card.dart';
import '../../../core/components/loader/loader_page.dart';
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
                  teacherUser: controller.teacherUser,
                  schoolModel: controller.schoolModel,
                ),
                appBar: AppBarHome(
                  onPressedDrawer: () =>
                      controller.scaffoldKey.currentState?.openDrawer(),
                  text: controller.schoolModel!.name,
                  onPressedHistoric: () => Modular.to.pushNamed('./historic'),
                ),
                body: Observer(
                  builder: (_) {
                    return controller.classes!.length == 0
                        ? Padding(
                            padding: const EdgeInsets.only(left: 40, right: 40),
                            child: Center(
                              child: Text(
                                'Você ainda não pertence a nenhuma turma, solicite ao administrador da escola!',
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        : ListView.builder(
                            padding: EdgeInsets.all(10.0),
                            itemCount: controller.classes!.length,
                            itemBuilder: (context, int index1) {
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: controller
                                    .classes![index1].subjectTeachers!.length,
                                itemBuilder: (context, int index2) {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: ClassesCard(
                                        assetimage:
                                            controller.definiBanner(index1),
                                        first:
                                            '${controller.classes![index1].level}º ano - ${controller.classes![index1].subjectTeachers![index2].subject}',
                                        second:
                                            'Sala ${controller.classes![index1].room}',
                                        third: controller.classes![index1].name,
                                        index: index1,
                                        onTap: () {
                                          Modular.to.pushNamed(
                                            './school-report',
                                            arguments: {
                                              'classe':
                                                  controller.classes![index1],
                                              'subjectTeacher': controller
                                                  .classes![index1]
                                                  .subjectTeachers![index2]
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
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
