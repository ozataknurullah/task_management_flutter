import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.fieldController,
    required this.hintText,
    required this.borderRadius,
    this.maxLines = 1,
  });

  final TextEditingController fieldController;
  final String hintText;
  final double borderRadius;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: const Color.fromARGB(174, 238, 238, 238),
      ),
      child: TextField(
        maxLines: maxLines,
        controller: fieldController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
