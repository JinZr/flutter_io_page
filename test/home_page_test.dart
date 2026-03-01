import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:zr_jin_page/main.dart';
import 'package:zr_jin_page/utilities/link_toolbar.dart';

Future<void> _pumpHomeAtSize(WidgetTester tester, Size size) async {
  await tester.binding.setSurfaceSize(size);
  addTearDown(() => tester.binding.setSurfaceSize(null));
  await tester.pumpWidget(const MyApp());
  await tester.pump();
}

Future<void> _disposeHome(WidgetTester tester) async {
  // Dispose the previous tree and allow deferred timers to complete.
  await tester.pumpWidget(const SizedBox.shrink());
  await tester.pump(const Duration(milliseconds: 800));
}

void main() {
  testWidgets('MyApp renders homepage shell at compact width', (
    WidgetTester tester,
  ) async {
    await _pumpHomeAtSize(tester, const Size(430, 932));
    final appBar = find.byType(AppBar);

    expect(find.byType(Scaffold), findsWidgets);
    expect(appBar, findsOneWidget);
    expect(find.byType(NestedScrollView), findsNothing);
    expect(find.byType(LinkToolbar), findsNothing);
    expect(
      find.descendant(of: appBar, matching: find.text('Google Scholar')),
      findsOneWidget,
    );
    expect(
      find.descendant(of: appBar, matching: find.byIcon(Icons.more_vert)),
      findsOneWidget,
    );
    expect(
      find.descendant(of: appBar, matching: find.text('GitHub')),
      findsNothing,
    );
    expect(tester.takeException(), isNull);

    await _disposeHome(tester);
  });

  testWidgets('MyApp renders homepage shell at regular width', (
    WidgetTester tester,
  ) async {
    await _pumpHomeAtSize(tester, const Size(1024, 900));
    final appBar = find.byType(AppBar);

    expect(find.byType(Scaffold), findsWidgets);
    expect(appBar, findsOneWidget);
    expect(find.byType(NestedScrollView), findsNothing);
    expect(find.byType(LinkToolbar), findsNothing);
    expect(
      find.descendant(of: appBar, matching: find.text('Google Scholar')),
      findsOneWidget,
    );
    expect(
      find.descendant(of: appBar, matching: find.byIcon(Icons.more_vert)),
      findsOneWidget,
    );
    expect(
      find.descendant(of: appBar, matching: find.text('GitHub')),
      findsNothing,
    );
    expect(tester.takeException(), isNull);

    await _disposeHome(tester);
  });

  testWidgets('MyApp loads deferred sections when scrolled into view', (
    WidgetTester tester,
  ) async {
    await _pumpHomeAtSize(tester, const Size(1024, 900));

    final scrollable = find.byType(Scrollable).last;
    await tester.scrollUntilVisible(
      find.text('My Polaroid Gallery'),
      420,
      scrollable: scrollable,
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));
    final appBar = find.byType(AppBar);

    expect(find.text('My Polaroid Gallery'), findsOneWidget);
    expect(find.byType(LinkToolbar), findsNothing);
    expect(
      find.descendant(of: appBar, matching: find.text('Google Scholar')),
      findsOneWidget,
    );
    expect(tester.takeException(), isNull);

    await _disposeHome(tester);
  });
}
