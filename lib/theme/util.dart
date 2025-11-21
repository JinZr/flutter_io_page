import 'package:flutter/material.dart';

TextTheme createTextTheme() {
  // Use the default Material text theme so sizes/weights follow the platform
  // without bundling custom font assets.
  return ThemeData(useMaterial3: true).textTheme;
}
