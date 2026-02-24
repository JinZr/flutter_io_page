import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:zr_jin_page/utilities/deferred_widget.dart';

import '../helpers/test_app.dart';

void main() {
  testWidgets(
    'DeferredWidget shows placeholder then loaded child with defaults',
    (WidgetTester tester) async {
      var loadCalls = 0;

      await pumpTestApp(
        tester,
        DeferredWidget(
          libraryLoader: () {
            loadCalls += 1;
            return Future<void>.value();
          },
          placeholder: const Text('Loading deferred widget'),
          builder: (_) => const Text('Deferred widget ready'),
        ),
      );

      expect(loadCalls, 1);
      expect(find.text('Loading deferred widget'), findsOneWidget);
      await tester.pump(const Duration(milliseconds: 140));
      await tester.pump();

      expect(find.text('Deferred widget ready'), findsOneWidget);
      expect(find.text('Loading deferred widget'), findsNothing);
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets('DeferredWidget honors maxDeferralFrames when set to zero', (
    WidgetTester tester,
  ) async {
    var loadCalls = 0;

    await pumpTestApp(
      tester,
      DeferredWidget(
        libraryLoader: () {
          loadCalls += 1;
          return Future<void>.value();
        },
        maxDeferralFrames: 0,
        minPlaceholderDuration: Duration.zero,
        placeholder: const SizedBox.shrink(),
        builder: (_) => const Text('Ready'),
      ),
    );

    expect(loadCalls, 1);
    await tester.pump();
    expect(find.text('Ready'), findsOneWidget);
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
        webDeferByFrame: false,
        minPlaceholderDuration: Duration.zero,
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

  testWidgets(
    'DeferredWidget keeps placeholder visible for minPlaceholderDuration',
    (WidgetTester tester) async {
      final completer = Completer<void>();

      await pumpTestApp(
        tester,
        DeferredWidget(
          libraryLoader: () => completer.future,
          webDeferByFrame: false,
          minPlaceholderDuration: const Duration(milliseconds: 200),
          placeholder: const Text('Loading deferred widget'),
          builder: (_) => const Text('Deferred widget ready'),
        ),
      );

      expect(find.text('Loading deferred widget'), findsOneWidget);
      completer.complete();

      await tester.pump();
      await tester.pump(const Duration(milliseconds: 150));
      expect(find.text('Loading deferred widget'), findsOneWidget);
      expect(find.text('Deferred widget ready'), findsNothing);

      await tester.pump(const Duration(milliseconds: 80));
      await tester.pump();
      expect(find.text('Deferred widget ready'), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );
}
