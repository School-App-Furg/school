import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../core/components/classes_card.dart';
import '../../../core/components/loader/loader_page.dart';
import '../../../core/components/selected_cycle.dart';
import '../../../core/styles/colors.dart';
import '../drawer/drawer.dart';
import 'components/alert_dialog_confirmation.dart';
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
                  schoolModel: controller.schoolModel,
                  cycle: controller.actualyCycle!,
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
                    onPressedSubject: controller.actualyCycle!.id! ==
                            controller.schoolModel!.currentCycle
                        ? () => Modular.to.pushNamed('./register-class')
                        : null),
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
                                padding: const EdgeInsets.all(40.0),
                                child: Text(
                                  'Sua escola ainda não possui turmas cadastradas neste ciclo!',
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
                                  physics: ScrollPhysics(),
                                  shrinkWrap: true,
                                  padding: EdgeInsets.all(10.0),
                                  itemCount: controller.classes!.length,
                                  itemBuilder: (context, int index) {
                                    return Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 5.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: controller.actualyCycle!.id! ==
                                                  controller
                                                      .schoolModel!.currentCycle
                                              ? Slidable(
                                                  endActionPane: ActionPane(
                                                    motion: ScrollMotion(),
                                                    children: [
                                                      SlidableAction(
                                                        onPressed: (context) =>
                                                            Modular.to.pushNamed(
                                                                "./edit-class",
                                                                arguments: {
                                                              'class_year':
                                                                  controller
                                                                          .classes![
                                                                      index],
                                                            }),
                                                        backgroundColor: grey,
                                                        foregroundColor:
                                                            defaultWhite,
                                                        icon: Icons.edit,
                                                        label: 'Editar',
                                                      ),
                                                      SlidableAction(
                                                        onPressed: (context) =>
                                                            showDialog<void>(
                                                          context: context,
                                                          barrierDismissible:
                                                              false,
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialogConfirmation(
                                                              onPressed: () {
                                                                controller
                                                                    .deleteClass(
                                                                  context,
                                                                  controller
                                                                          .classes![
                                                                      index],
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                        backgroundColor:
                                                            lightred,
                                                        foregroundColor:
                                                            defaultWhite,
                                                        icon: Icons.delete,
                                                        label: 'Excluir',
                                                      ),
                                                    ],
                                                  ),
                                                  child: ClassesCard(
                                                    assetimage: controller
                                                        .definiBanner(index),
                                                    first:
                                                        '${controller.classes![index].level}º ano',
                                                    second:
                                                        'Sala ${controller.classes![index].room}',
                                                    third: controller
                                                        .classes![index].name,
                                                    index: index,
                                                    onTap: () =>
                                                        Modular.to.pushNamed(
                                                      "./students-list-class",
                                                      arguments: {
                                                        'classe': controller
                                                            .classes![index],
                                                        'cycle': controller
                                                            .actualyCycle
                                                      },
                                                    ),
                                                  ),
                                                )
                                              : ClassesCard(
                                                  assetimage: controller
                                                      .definiBanner(index),
                                                  first:
                                                      '${controller.classes![index].level}º ano',
                                                  second:
                                                      'Sala ${controller.classes![index].room}',
                                                  third: controller
                                                      .classes![index].name,
                                                  index: index,
                                                  onTap: () =>
                                                      Modular.to.pushNamed(
                                                    "./students-list-class",
                                                    arguments: {
                                                      'classe': controller
                                                          .classes![index],
                                                      'cycle': controller
                                                          .actualyCycle
                                                    },
                                                  ),
                                                ),
                                        ));
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
