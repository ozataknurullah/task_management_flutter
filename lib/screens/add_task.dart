import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/controllers/data_controller.dart';
import 'package:task_management/design/page_color_design.dart';
import 'package:task_management/screens/all_tasks.dart';
import 'package:task_management/utils/app_colors.dart';
import 'package:task_management/widgets/button_widgets.dart';
import 'package:task_management/widgets/error_warning.dart';
import 'package:task_management/widgets/text_field_widget.dart';

import 'home_screen.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController nameController = TextEditingController();
  TextEditingController detailController = TextEditingController();

  bool _dataValidation() {
    if (nameController.text.trim() == '') {
      ErrorMessageWidget.taskErrorOrWarning("Task Name", "Task Name is empty");
      return false;
    } else if (detailController.text.trim() == '') {
      ErrorMessageWidget.taskErrorOrWarning(
          "Task Detail", "Task Detail is empty");
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageColorDesign(
        color1: AppColors.secondColor,
        color2: AppColors.secondColor,
        rotation: 90,
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 40),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () {
                          Get.to(() => const HomeScreen(),
                              transition: Transition.fadeIn);
                        },
                        icon: const Icon(Icons.arrow_back,
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 15),
                    const Padding(
                      padding: EdgeInsets.all(28.0),
                      child: Text(
                        "Yeni Görev Ekle",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(181, 12, 29, 31)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 25),
                Column(
                  children: [
                    TextFieldWidget(
                      fieldController: nameController,
                      hintText: "Görev Adı",
                      borderRadius: 15,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 30),
                    TextFieldWidget(
                      fieldController: detailController,
                      hintText: "Görev detayı",
                      borderRadius: 15,
                      maxLines: 4,
                    ),
                    const SizedBox(height: 50),
                    GestureDetector(
                      onTap: () {
                        if (_dataValidation()) {
                          Get.find<DataController>().postData(
                            nameController.text.trim(),
                            detailController.text.trim(),
                          );
                          Get.off(() => const AllTasks(),
                              transition: Transition.fadeIn);
                        }
                      },
                      child: const ButtonWidget(
                        backgroundcolor: AppColors.buttonColor1,
                        width: 250,
                        text: "Kaydet",
                        textColor: AppColors.textHolder,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
