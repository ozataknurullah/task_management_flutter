import 'package:flutter/material.dart';

class PageColorDesign extends StatelessWidget {
  const PageColorDesign({
    super.key,
    required this.color1,
    required this.color2,
    required this.child,
    this.left = 20,
    this.right = 20,
    required this.rotation,
  });

  final Widget child;
  final Color color1;
  final Color color2;
  final double left;
  final double right;
  final double rotation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      padding: EdgeInsets.only(left: left, right: right),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color1, color2],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              transform: GradientRotation(rotation))),
      child: child,
    );
  }
}
