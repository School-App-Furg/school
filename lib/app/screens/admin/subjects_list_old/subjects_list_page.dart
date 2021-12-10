import 'package:flutter/material.dart';

import 'subjects_list_controller.dart';

class SubjectsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SubjectsListController controller = SubjectsListController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Disciplinas'),
      ),
      key: controller.scaffoldKey,
      drawerScrimColor: Colors.transparent,
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 2.0,
        ),
        padding: EdgeInsets.all(10.0),
        itemCount: controller.classRoomList.length,
        itemBuilder: (context, int index) {
          return GestureDetector(
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5.0),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage(controller.definiBanner(index)),
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
                                controller.classRoomList[index].name,
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
                            onPressed: () {},
                            icon: const Icon(Icons.more_vert),
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Text(
                        'Professor(a): ' +
                            controller.classRoomList[index].teacher,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w700,
                        ),
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
