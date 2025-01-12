import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/design/left_slide.dart';
import 'package:task_management/design/page_color_design.dart';
import 'package:task_management/design/right_slide.dart';
import 'package:task_management/screens/add_task.dart';
import 'package:task_management/screens/home_screen.dart';
import 'package:task_management/utils/app_colors.dart';
import 'package:task_management/widgets/down_bar.dart';
import 'package:task_management/widgets/task_widget.dart';

import '../controllers/data_controller.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({super.key});

  @override
  Widget build(BuildContext context) {
    final DataController dataController =
        Get.find<DataController>(); // DataController'ı alıyoruz
    print(dataController.myData.length);

    // Verileri yüklemek için çağırıyoruz
    WidgetsBinding.instance.addPostFrameCallback((_) {
      dataController.getData();
    });

    return Scaffold(
      body: PageColorDesign(
        color1: AppColors.secondColor,
        color2: AppColors.secondColor,
        rotation: 180,
        right: 5,
        left: 5,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 65),
              alignment: Alignment.topLeft,
              child: InkWell(
                onTap: () {
                  Get.to(() => const HomeScreen(),
                      transition: Transition.fadeIn);
                },
                child: const Icon(Icons.arrow_back),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.home),
                  color: Colors.black54,
                  onPressed: () {
                    Get.to(() => const HomeScreen(),
                        transition: Transition.fadeIn);
                  },
                ),
                IconButton(
                  onPressed: () {
                    Get.to(() => const AddTask(),
                        transition: Transition.fadeIn);
                  },
                  icon: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.5),
                      color: Colors.black54,
                    ),
                    child: const Icon(Icons.add, color: Colors.white70),
                  ),
                ),
                Expanded(child: Container()),
                const Icon(Icons.calendar_month_sharp,
                    color: AppColors.textHolder),
                const SizedBox(width: 10),
                // Verilerin sayısını göstermek için Obx kullanıyoruz
                Obx(() => Text("${dataController.myData.length}",
                    style:
                        const TextStyle(fontSize: 20, color: Colors.black54))),
              ],
            ),
            Flexible(
              // Veriyi dinlemek için Obx kullanıyoruz
              child: Obx(() {
                if (dataController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (dataController.myData.isEmpty) {
                  return const Center(child: Text("No tasks available"));
                } else {
                  return ListView.builder(
                    itemCount: dataController.myData.length,
                    itemBuilder: (context, index) {
                      final task = dataController.myData[index];
                      // Verinin null olup olmadığını kontrol edip atıyoruz
                      final taskName = task['task_name'] ?? 'Unknown task';
                      final taskDetail = task['task_detail'] ?? 'No details';

                      return Dismissible(
                        background: const LeftEditIcon(),
                        secondaryBackground: const RightDeleteIcon(),
                        onDismissed: (DismissDirection direction) async {},
                        confirmDismiss: (DismissDirection direction) async {
                          if (direction == DismissDirection.startToEnd) {
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              barrierColor: Colors.transparent,
                              context: context,
                              builder: (_) {
                                return DownBar();
                              },
                            );
                            return false;
                          } else {
                            return Future.delayed(
                              const Duration(seconds: 1),
                              () => direction == DismissDirection.endToStart,
                            );
                          }
                        },
                        key: ObjectKey(index),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: TaskWidget(
                            text: taskName, // Görevin adı
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      );
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
