import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/components/classes_card.dart';
import '../../../core/components/loader/loader_page.dart';
import '../../../core/components/selected_cycle.dart';
import '../drawer/drawer.dart';
import 'components/app_bar_home.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
                  onPressedHistoric: () => Modular.to.pushNamed(
                    './historic',
                    arguments: {
                      'schoolId': controller.schoolModel!.id,
                      'cycle': controller.actualyCycle
                    },
                  ),
                ),
                body: Observer(
                  builder: (_) {
                    return controller.classes!.isEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Visibility(
                                visible: controller.actualyCycle!.id !=
                                    controller.schoolModel!.currentCycle,
                                child: SelectedCyclePeriod(
                                  cycleName:
                                      'Ciclo selecionado: ${controller.actualyCycle!.name}',
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 40, right: 40),
                                child: Text(
                                  'Voc?? ainda n??o pertence a nenhuma turma, solicite ao administrador da escola!',
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox()
                            ],
                          )
                        : SingleChildScrollView(
                            child: Column(
                              children: [
                                Visibility(
                                  visible: controller.actualyCycle!.id !=
                                      controller.schoolModel!.currentCycle,
                                  child: SelectedCyclePeriod(
                                    cycleName:
                                        'Ciclo selecionado: ${controller.actualyCycle!.name}',
                                  ),
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  itemCount: controller.classes!.length,
                                  itemBuilder: (context, int index1) {
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: controller.classes![index1]
                                          .subjectTeachers!.length,
                                      itemBuilder: (context, int index2) {
                                        return Container(
                                          margin: const EdgeInsets.only(
                                              left: 10.0,
                                              right: 10,
                                              bottom: 5,
                                              top: 5),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: ClassesCard(
                                              assetimage: controller
                                                  .definiBanner(index1),
                                              first:
                                                  '${controller.classes![index1].level}?? ano - ${controller.classes![index1].subjectTeachers![index2].subject}',
                                              second:
                                                  'Sala ${controller.classes![index1].room}',
                                              third: controller
                                                  .classes![index1].name,
                                              index: index1,
                                              onTap: () {
                                                Modular.to.pushNamed(
                                                  './school-report',
                                                  arguments: {
                                                    'classe': controller
                                                        .classes![index1],
                                                    'subjectTeacher': controller
                                                            .classes![index1]
                                                            .subjectTeachers![
                                                        index2],
                                                    'cycle':
                                                        controller.actualyCycle,
                                                    'schoolModel':
                                                        controller.schoolModel
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                  },
                ),
              );
      },
    );
  }
}
