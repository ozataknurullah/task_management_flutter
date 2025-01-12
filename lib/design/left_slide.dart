import 'package:flutter/material.dart';

class LeftEditIcon extends StatelessWidget {
  const LeftEditIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: const Color.fromARGB(255, 0, 0, 0),
      child: const Icon(
        Icons.edit,
        color: Colors.white,
      ),
    );
  }
}
