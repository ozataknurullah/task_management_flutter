import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/design/page_color_design.dart';
import 'package:task_management/screens/add_task.dart';
import 'package:task_management/screens/all_tasks.dart';
import 'package:task_management/utils/app_colors.dart';
import 'package:task_management/widgets/button_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageColorDesign(
          color1: AppColors.secondColor,
          color2: AppColors.secondColor,
          rotation: 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: const TextSpan(
                  text: "Merhaba,",
                  style: TextStyle(
                      color: AppColors.textHolder,
                      fontSize: 60,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: "\nGününüzü Planlamaya Başlayın",
                      style: TextStyle(
                        color: AppColors.textHolder,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const AddTask(),
                      transition: Transition.fadeIn,
                      duration: const Duration(milliseconds: 500));
                },
                child: ButtonWidget(
                  backgroundcolor: AppColors.buttonColor1,
                  text: "Yeni Görev",
                  textColor: AppColors.textHolder,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const AllTasks(),
                      transition: Transition.fadeIn,
                      duration: const Duration(milliseconds: 500));
                },
                child: ButtonWidget(
                  backgroundcolor: AppColors.buttonColor2,
                  text: "Tümünü Görüntüle",
                  textColor: AppColors.textHolder,
                ),
              ),
            ],
          )),
    );
  }
}
