import 'package:flutter/material.dart';

TextStyle regularTextStyle(bool isLightMode, double fontSize) {
  if (!isLightMode) {
    return TextStyle(
      color: Colors.white.withOpacity(0.8),
      fontSize: fontSize,
    );
  } else {
    return TextStyle(
      color: Colors.black.withOpacity(0.8),
      fontSize: fontSize,
    );
  }
}

TextStyle matchTextStyle(
    BuildContext context, bool isLightMode, double fontSize) {
  if (!isLightMode) {
    return TextStyle(
      // color: Colors.white.withOpacity(0.8),
      color: Theme.of(context).colorScheme.primary.withOpacity(0.9),
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
      decoration: TextDecoration.underline,
    );
  } else {
    return TextStyle(
      // color: Colors.black.withOpacity(0.8),
      color: Theme.of(context).colorScheme.primary.withOpacity(0.9),
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
      decoration: TextDecoration.underline,
    );
  }
}
