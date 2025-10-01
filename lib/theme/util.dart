import 'package:flutter/material.dart';

TextTheme createTextTheme(
    BuildContext context, String bodyFontString, String displayFontString) {
  final baseTextTheme = Theme.of(context).textTheme;
  final bodyTextTheme = baseTextTheme.apply(fontFamily: bodyFontString);
  return bodyTextTheme.copyWith(
    displayLarge:
        bodyTextTheme.displayLarge?.copyWith(fontFamily: displayFontString),
    displayMedium:
        bodyTextTheme.displayMedium?.copyWith(fontFamily: displayFontString),
    displaySmall:
        bodyTextTheme.displaySmall?.copyWith(fontFamily: displayFontString),
    headlineLarge:
        bodyTextTheme.headlineLarge?.copyWith(fontFamily: displayFontString),
    headlineMedium:
        bodyTextTheme.headlineMedium?.copyWith(fontFamily: displayFontString),
    headlineSmall:
        bodyTextTheme.headlineSmall?.copyWith(fontFamily: displayFontString),
    titleLarge:
        bodyTextTheme.titleLarge?.copyWith(fontFamily: displayFontString),
    titleMedium:
        bodyTextTheme.titleMedium?.copyWith(fontFamily: displayFontString),
    titleSmall:
        bodyTextTheme.titleSmall?.copyWith(fontFamily: displayFontString),
  );
}
