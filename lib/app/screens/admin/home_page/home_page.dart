import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'components/alert_dialog_confirmation.dart';
import '../../../core/components/classes_card.dart';
import '../../../core/components/loader/loader_page.dart';
import '../../../core/styles/colors.dart';
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
                  //Adição do cyclePeriod na tela do admin conforme seleção do ciclo
                  cyclePeriod: "Ciclo: 2021/2",
                  onPressedDrawer: () =>
                      controller.scaffoldKey.currentState?.openDrawer(),
                  text: controller.schoolModel!.name,
                  onPressedHistoric: () => Modular.to.pushNamed('./historic'),
                  onPressedSubject: () =>
                      Modular.to.pushNamed('./register-class'),
                ),
                body: Observer(
                  builder: (_) {
                    return controller.classes!.length == 0
                        ? Center(
                            child: Text(
                                'Sua escola ainda não possui turmas cadastradas neste ciclo!'),
                          )
                        : ListView.builder(
                            padding: EdgeInsets.all(10.0),
                            itemCount: controller.classes!.length,
                            itemBuilder: (context, int index) {
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Slidable(
                                    endActionPane: ActionPane(
                                      motion: ScrollMotion(),
                                      children: [
                                        SlidableAction(
                                          onPressed: (context) => Modular.to
                                              .pushNamed("./edit-class",
                                                  arguments: {
                                                'class_year':
                                                    controller.classes![index],
                                              }),
                                          backgroundColor: grey,
                                          foregroundColor: Colors.white,
                                          icon: Icons.edit,
                                          label: 'Editar',
                                        ),
                                        SlidableAction(
                                          onPressed: (context) =>
                                              showDialog<void>(
                                            context: context,
                                            barrierDismissible:
                                                false, // user must tap button!
                                            builder: (BuildContext context) {
                                              return AlertDialogConfirmation(
                                                onPressed: () {
                                                  controller.deleteClass(
                                                      context,
                                                      controller
                                                          .classes![index]);
                                                },
                                              );
                                            },
                                          ),
                                          backgroundColor: lightred,
                                          foregroundColor: Colors.white,
                                          icon: Icons.delete,
                                          label: 'Excluir',
                                        ),
                                      ],
                                    ),
                                    child: ClassesCard(
                                      assetimage:
                                          controller.definiBanner(index),
                                      first:
                                          '${controller.classes![index].level}º ano',
                                      second:
                                          'Sala ${controller.classes![index].room}',
                                      third: controller.classes![index].name,
                                      index: index,
                                      onTap: () => Modular.to.pushNamed(
                                        "./students-list-class",
                                        arguments: {
                                          'classe': controller.classes![index]
                                        },
                                      ),
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
