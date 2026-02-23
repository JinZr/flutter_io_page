import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:zr_jin_page/home_components/card_placeholder.dart';

import '../helpers/test_app.dart';

void main() {
  testWidgets('CardPlaceholder keeps minimum height and progress indicator', (
    WidgetTester tester,
  ) async {
    await pumpTestApp(
      tester,
      const Center(
        child: SizedBox(width: 420, child: CardPlaceholder(minHeight: 240)),
      ),
      surfaceSize: const Size(430, 932),
    );

    expect(find.byType(CardPlaceholder), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    final Size cardSize = tester.getSize(find.byType(Card));
    expect(cardSize.height, greaterThanOrEqualTo(240));
    expect(tester.takeException(), isNull);
  });
}
