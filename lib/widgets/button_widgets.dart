import 'package:flutter/material.dart';
import 'package:task_management/utils/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  final Color backgroundcolor;
  final String text;
  final Color textColor;
  final double width;
  const ButtonWidget(
      {super.key,
      required this.backgroundcolor,
      required this.text,
      required this.textColor,
      this.width = double.maxFinite});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: MediaQuery.of(context).size.height / 14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.secondColor,
        boxShadow: const [
          BoxShadow(
            offset: Offset(6, 6),
            color: Color.fromARGB(255, 0, 0, 0),
            blurRadius: 30,
          ),
          BoxShadow(
              offset: Offset(-6, -6),
              color: Color.fromARGB(255, 255, 255, 255),
              blurRadius: 30),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 30, color: textColor),
        ),
      ),
    );
  }
}
