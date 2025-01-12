import 'package:flutter/material.dart';

class RightDeleteIcon extends StatelessWidget {
  const RightDeleteIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: const Color.fromARGB(255, 255, 0, 0),
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }
}
