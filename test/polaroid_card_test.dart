import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:zr_jin_page/home_components/polaroid_card.dart';
import 'package:zr_jin_page/theme/layout_tokens.dart';

import 'helpers/test_app.dart';

void main() {
  testWidgets('uses compact gallery grid on narrow widths', (
    WidgetTester tester,
  ) async {
    await pumpCard(
      tester,
      PolaroidCard(layout: LayoutTokens.compact()),
      width: 430,
    );

    expect(find.text('Tap an image to open it full screen'), findsOneWidget);
    expect(find.byType(GridView), findsOneWidget);
    expect(find.byType(CarouselView), findsNothing);
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
    expect(find.byType(GridView), findsNothing);
    expect(tester.takeException(), isNull);
  });
}
