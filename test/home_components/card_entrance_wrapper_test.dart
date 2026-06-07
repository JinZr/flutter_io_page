import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:zr_jin_page/home_components/card_entrance_wrapper.dart';

import '../helpers/test_app.dart';

void main() {
  double opacity(WidgetTester tester) {
    final fadeFinder = find.descendant(
      of: find.byType(HomeCardEntrance),
      matching: find.byType(FadeTransition),
    );
    return tester.widget<FadeTransition>(fadeFinder.first).opacity.value;
  }

  testWidgets('HomeCardEntrance starts animation after configured delay', (
    WidgetTester tester,
  ) async {
    await pumpTestApp(
      tester,
      const HomeCardEntrance(
        delay: Duration(milliseconds: 200),
        child: Text('Delayed card'),
      ),
    );

    expect(find.text('Delayed card'), findsOneWidget);
    expect(opacity(tester), equals(0));

    await tester.pump(const Duration(milliseconds: 150));
    expect(opacity(tester), equals(0));

    await tester.pump(const Duration(milliseconds: 140));
    await tester.pump(const Duration(milliseconds: 80));
    expect(opacity(tester), greaterThan(0));
    expect(tester.takeException(), isNull);
  });

  testWidgets('HomeCardEntrance animates immediately when delay is zero', (
    WidgetTester tester,
  ) async {
    await pumpTestApp(
      tester,
      const HomeCardEntrance(
        delay: Duration.zero,
        child: Text('Immediate card'),
      ),
    );

    await tester.pump(const Duration(milliseconds: 120));

    expect(find.text('Immediate card'), findsOneWidget);
    expect(opacity(tester), greaterThan(0));
    expect(tester.takeException(), isNull);
  });
}
