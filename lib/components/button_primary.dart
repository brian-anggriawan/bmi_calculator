import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  ButtonPrimary({this.buttonChild, this.onTap});

  final Widget? buttonChild;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffeb1555),
        ),
        child: buttonChild,
      ),
    );
  }
}
