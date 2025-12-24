import 'package:flutter/material.dart';

TextTheme createTextTheme() {
  final baseTheme = ThemeData(useMaterial3: true).textTheme;
  const titleFontFamily = "DM Serif Text";

  TextStyle? applyTitleFont(TextStyle? style) {
    return style?.copyWith(
      fontFamily: titleFontFamily,
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

const _publicationTitleFontFamily = "Roboto Serif";

TextStyle publicationTitleTextStyle(TextTheme textTheme) {
  final baseStyle = textTheme.titleMedium ?? const TextStyle();
  return baseStyle.copyWith(
    fontFamily: _publicationTitleFontFamily,
    fontWeight: FontWeight.w600,
  );
}
