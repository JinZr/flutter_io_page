import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:zr_jin_page/home_components/self_intro_card.dart';
import 'package:zr_jin_page/theme/layout_tokens.dart';

import '../helpers/test_app.dart';

const _emailText = 'zengrui.jin0 [at] gmail.com';

void main() {
  testWidgets('IntroductionCard renders in compact layout', (
    WidgetTester tester,
  ) async {
    await pumpCard(
      tester,
      IntroductionCard(layout: LayoutTokens.compact()),
      width: 430,
    );

    expect(find.text('Biography'), findsOneWidget);
    expect(find.text('Ph.D. Thesis'), findsOneWidget);
    expect(find.text('Tap to copy email'), findsOneWidget);
    final context = tester.element(find.byType(IntroductionCard));
    final expectedFontSize = Theme.of(context).textTheme.bodyLarge?.fontSize;
    final email = tester.widget<Text>(find.text(_emailText));
    expect(email.style?.fontSize, expectedFontSize);
    expect(tester.takeException(), isNull);
  });

  testWidgets('IntroductionCard renders in regular layout', (
    WidgetTester tester,
  ) async {
    await pumpCard(
      tester,
      IntroductionCard(layout: LayoutTokens.regular()),
      width: 1024,
    );

    expect(find.text('Biography'), findsOneWidget);
    expect(find.text('Ph.D. Thesis'), findsOneWidget);
    expect(find.text(_emailText), findsOneWidget);
    final context = tester.element(find.byType(IntroductionCard));
    final expectedFontSize = Theme.of(context).textTheme.bodyLarge?.fontSize;
    final email = tester.widget<Text>(find.text(_emailText));
    expect(email.style?.fontSize, expectedFontSize);
    expect(tester.takeException(), isNull);
  });
}
