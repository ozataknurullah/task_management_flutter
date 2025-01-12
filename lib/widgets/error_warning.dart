import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorMessageWidget {
  static void taskErrorOrWarning(String taskName, String taskErrorOrWarning) {
    Get.snackbar(
      taskName,
      taskErrorOrWarning,
      titleText: Text(
        taskName,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        taskErrorOrWarning,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
