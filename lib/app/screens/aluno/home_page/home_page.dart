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
                  studentUser: controller.userStudent,
                ),
                appBar: AppBarHome(
                  text: controller.schoolModel!.name,
                  onPressedDrawer: () =>
                      controller.scaffoldKey.currentState?.openDrawer(),
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
                    return controller.subjects.isEmpty
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
                                padding: const EdgeInsets.all(40.0),
                                child: Text(
                                  'Nenhuma disciplina foi cadastrada at?? o momento!',
                                  style: TextStyle(fontSize: 20),
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
                                  padding: EdgeInsets.all(10.0),
                                  itemCount: controller.subjects.length,
                                  itemBuilder: (context, int index) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: ClassesCard(
                                          assetimage:
                                              controller.definiBanner(index),
                                          first: controller
                                              .subjects[index].subject,
                                          second: controller
                                              .subjects[index].teacher,
                                          third: "",
                                          index: index,
                                          onTap: () {
                                            Modular.to.pushNamed(
                                              './student-report',
                                              arguments: {
                                                'studentId':
                                                    controller.userStudent!.id,
                                                'subjectTeacher':
                                                    controller.subjects[index],
                                                'cycle': controller.actualyCycle
                                              },
                                            );
                                          },
                                        ),
                                      ),
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
