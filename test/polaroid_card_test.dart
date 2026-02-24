import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:zr_jin_page/home_components/polaroid_card.dart';
import 'package:zr_jin_page/theme/layout_tokens.dart';

import 'helpers/test_app.dart';

void main() {
  testWidgets('keeps weighted carousel on narrow widths', (
    WidgetTester tester,
  ) async {
    await pumpCard(
      tester,
      PolaroidCard(layout: LayoutTokens.compact()),
      width: 430,
    );

    expect(find.text('Swipe to browse the gallery'), findsOneWidget);
    expect(find.byType(CarouselView), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('keeps weighted carousel on wider layouts', (
    WidgetTester tester,
  ) async {
    await pumpCard(
      tester,
      PolaroidCard(layout: LayoutTokens.regular()),
      width: 1024,
    );

    expect(find.text('Swipe to browse the gallery'), findsOneWidget);
    expect(find.byType(CarouselView), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('keeps carousel for Apple-hosted web rendering', (
    WidgetTester tester,
  ) async {
    await pumpCard(
      tester,
      PolaroidCard(
        layout: LayoutTokens.regular(),
        isAppleWebHostOverride: true,
      ),
      width: 1024,
    );

    expect(find.text('Swipe to browse the gallery'), findsOneWidget);
    expect(find.byType(CarouselView), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
