// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ColorfulSafeArea extends StatelessWidget {
  ColorfulSafeArea(
      {Key? key, required this.backgroundColor, required this.child})
      : super(key: key);

  Widget child;
  Color backgroundColor;

  @override
  Widget build(BuildContext context) => Container(
        color: backgroundColor,
        child: SafeArea(child: child),
      );
}
