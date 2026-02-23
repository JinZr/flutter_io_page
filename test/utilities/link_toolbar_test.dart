import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:zr_jin_page/utilities/link_toolbar.dart';

import '../helpers/test_app.dart';

void main() {
  final popupMenuFinder = find.byWidgetPredicate((widget) {
    return widget is PopupMenuButton;
  });

  Future<void> pumpToolbar(
    WidgetTester tester, {
    required double width,
    required bool floating,
  }) async {
    await tester.binding.setSurfaceSize(Size(width, 900));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(
      MaterialApp(
        theme: buildTestTheme(),
        home: Scaffold(
          body: Center(
            child: SizedBox(
              width: width,
              child: LinkToolbar(floating: floating),
            ),
          ),
        ),
      ),
    );
    await tester.pump();
  }

  testWidgets('uses overflow menu below overflow breakpoint', (
    WidgetTester tester,
  ) async {
    await pumpToolbar(tester, width: 420, floating: false);

    expect(find.text('Google Scholar'), findsOneWidget);
    expect(popupMenuFinder, findsOneWidget);
    expect(find.text('GitHub'), findsNothing);
    expect(find.text('ResearchGate'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('shows three text actions between breakpoints', (
    WidgetTester tester,
  ) async {
    await pumpToolbar(tester, width: 500, floating: false);

    expect(popupMenuFinder, findsNothing);
    expect(find.text('Google Scholar'), findsOneWidget);
    expect(find.text('GitHub'), findsOneWidget);
    expect(find.text('ResearchGate'), findsOneWidget);
    expect(find.byIcon(Icons.school), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('shows icon+text actions at wide width', (
    WidgetTester tester,
  ) async {
    await pumpToolbar(tester, width: 700, floating: true);

    expect(popupMenuFinder, findsNothing);
    expect(find.text('Google Scholar'), findsOneWidget);
    expect(find.text('GitHub'), findsOneWidget);
    expect(find.text('ResearchGate'), findsOneWidget);
    expect(find.byIcon(Icons.school), findsOneWidget);
    expect(find.byIcon(Icons.code), findsOneWidget);
    expect(find.byIcon(Icons.science), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
