import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:zr_jin_page/utilities/deferred_widget.dart';

import '../helpers/test_app.dart';

void main() {
  testWidgets('DeferredWidget shows placeholder then loaded child', (
    WidgetTester tester,
  ) async {
    final completer = Completer<void>();
    var loadCalls = 0;

    await pumpTestApp(
      tester,
      DeferredWidget(
        libraryLoader: () {
          loadCalls += 1;
          return completer.future;
        },
        placeholder: const Text('Loading deferred widget'),
        builder: (_) => const Text('Deferred widget ready'),
      ),
    );

    expect(loadCalls, 1);
    expect(find.text('Loading deferred widget'), findsOneWidget);
    expect(find.text('Deferred widget ready'), findsNothing);

    completer.complete();
    await tester.pump();
    await tester.pump();

    expect(find.text('Deferred widget ready'), findsOneWidget);
    expect(find.text('Loading deferred widget'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('DeferredWidget calls loader once across rebuilds', (
    WidgetTester tester,
  ) async {
    var loadCalls = 0;

    Widget buildHarness() {
      return DeferredWidget(
        libraryLoader: () {
          loadCalls += 1;
          return Future<void>.value();
        },
        placeholder: const SizedBox.shrink(),
        builder: (_) => const Text('Ready'),
      );
    }

    await pumpTestApp(tester, buildHarness());
    await tester.pump();

    await tester.pumpWidget(buildTestApp(buildHarness()));
    await tester.pump();

    expect(loadCalls, 1);
    expect(find.text('Ready'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
