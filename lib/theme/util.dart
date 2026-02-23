import 'package:flutter/material.dart';

const _titleFontFamily = "DM Serif Text";

TextTheme createTextTheme() {
  final baseTheme = ThemeData(useMaterial3: true).textTheme;

  TextStyle? applyTitleFont(TextStyle? style) {
    return style?.copyWith(
      fontFamily: _titleFontFamily,
      fontWeight: FontWeight.w400,
    );
  }

  return baseTheme.copyWith(
    displayLarge: applyTitleFont(baseTheme.displayLarge),
    displayMedium: applyTitleFont(baseTheme.displayMedium),
    displaySmall: applyTitleFont(baseTheme.displaySmall),
    headlineLarge: applyTitleFont(baseTheme.headlineLarge),
    headlineMedium: applyTitleFont(baseTheme.headlineMedium),
    headlineSmall: applyTitleFont(baseTheme.headlineSmall),
    titleLarge: applyTitleFont(baseTheme.titleLarge),
    titleMedium: applyTitleFont(baseTheme.titleMedium),
    titleSmall: applyTitleFont(baseTheme.titleSmall),
  );
}
