import 'dart:ui';

import 'package:flutter/material.dart';
import '../../../core/components/popup_menu.dart';
import '../drawer/drawer.dart';
import 'components/app_bar_home.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      drawerScrimColor: Colors.transparent,
      drawer: HomeDrawer(),
      appBar: AppBarHome(
          onPressed: () => controller.scaffoldKey.currentState?.openDrawer()),
      body: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: controller.classRoomList.length,
        itemBuilder: (context, int index) {
          return GestureDetector(
            child: Stack(
              children: [
                Container(
                  height: 170,
                  margin: const EdgeInsets.symmetric(vertical: 5.0),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(
                      image: controller.classRoomList[index].bannerImg,
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.classRoomList[index].anoTurma,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 5.0),
                            ],
                          ),
                          IconButton(
                            onPressed: () => PopupMenu(),
                            icon: const Icon(Icons.more_vert),
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.classRoomList[index].sala,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            controller.classRoomList[index].turmas,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
