import 'package:flutter_test/flutter_test.dart';

import 'package:zr_jin_page/home_components/contrib_card.dart';
import 'package:zr_jin_page/theme/layout_tokens.dart';

import '../helpers/test_app.dart';

void main() {
  testWidgets('ContribCard renders compact layout content', (
    WidgetTester tester,
  ) async {
    await pumpCard(
      tester,
      ContribCard(layout: LayoutTokens.compact()),
      width: 430,
    );

    expect(find.text('Contribution to Open Source'), findsOneWidget);
    expect(find.text('Selected repositories'), findsOneWidget);
    expect(find.text('k2-fsa/icefall'), findsOneWidget);
    expect(find.text('lhotse-speech/lhotse'), findsOneWidget);
    expect(find.text('GitHub Repository'), findsNWidgets(2));
    expect(find.text('Open Project'), findsNWidgets(2));
    expect(tester.takeException(), isNull);
  });

  testWidgets('ContribCard renders regular layout content', (
    WidgetTester tester,
  ) async {
    await pumpCard(
      tester,
      ContribCard(layout: LayoutTokens.regular()),
      width: 1024,
    );

    expect(find.text('Contribution to Open Source'), findsOneWidget);
    expect(find.text('Selected repositories'), findsOneWidget);
    expect(find.text('k2-fsa/icefall'), findsOneWidget);
    expect(find.text('lhotse-speech/lhotse'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
