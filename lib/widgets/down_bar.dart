import 'package:flutter/material.dart';
import 'package:task_management/utils/app_colors.dart';
import 'package:task_management/widgets/button_widgets.dart';

class DownBar extends StatelessWidget {
  const DownBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      decoration: const BoxDecoration(
          color: Color.fromARGB(212, 238, 238, 238),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ButtonWidget(
              backgroundcolor: AppColors.buttonColor2,
              text: "İncele",
              textColor: AppColors.textGrey,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ButtonWidget(
              backgroundcolor: AppColors.buttonColor2,
              text: "Düzenle",
              textColor: AppColors.textGrey,
            ),
          ),
        ],
      ),
    );
  }
}
