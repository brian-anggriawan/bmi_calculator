import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({this.containerChild, this.color, this.onPress});

  final Widget? containerChild;
  final Color? color;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: containerChild,
      ),
    );
  }
}
