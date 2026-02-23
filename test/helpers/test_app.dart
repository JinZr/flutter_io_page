import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:zr_jin_page/theme/layout_tokens.dart';

ThemeData buildTestTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    extensions: <ThemeExtension<dynamic>>[LayoutTokens.regular()],
  );
}

Widget buildTestApp(Widget child, {bool scrollable = false}) {
  return MaterialApp(
    theme: buildTestTheme(),
    home: Scaffold(
      body: scrollable ? SingleChildScrollView(child: child) : child,
    ),
  );
}

Future<void> pumpTestApp(
  WidgetTester tester,
  Widget child, {
  Size? surfaceSize,
  bool scrollable = false,
}) async {
  if (surfaceSize != null) {
    await tester.binding.setSurfaceSize(surfaceSize);
    addTearDown(() => tester.binding.setSurfaceSize(null));
  }

  await tester.pumpWidget(buildTestApp(child, scrollable: scrollable));
  await tester.pump();
}

Future<void> pumpCard(
  WidgetTester tester,
  Widget card, {
  required double width,
  double height = 1200,
}) async {
  await pumpTestApp(
    tester,
    Center(
      child: SizedBox(width: width, child: card),
    ),
    surfaceSize: Size(width, height),
    scrollable: true,
  );
}
