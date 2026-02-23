import 'package:flutter_test/flutter_test.dart';

import 'package:zr_jin_page/home_components/self_intro_card.dart';
import 'package:zr_jin_page/theme/layout_tokens.dart';

import '../helpers/test_app.dart';

void main() {
  testWidgets('IntroductionCard renders in compact layout', (
    WidgetTester tester,
  ) async {
    await pumpCard(
      tester,
      IntroductionCard(layout: LayoutTokens.compact()),
      width: 430,
    );

    expect(find.text('Bio'), findsOneWidget);
    expect(find.text('Ph.D. Thesis'), findsOneWidget);
    expect(find.text('Tap to copy email'), findsOneWidget);
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

    expect(find.text('Bio'), findsOneWidget);
    expect(find.text('Ph.D. Thesis'), findsOneWidget);
    expect(find.text('zengrui.jin0 [at] gmail.com'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
