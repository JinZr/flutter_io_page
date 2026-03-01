import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import 'package:zr_jin_page/home_components/selected_pub_card.dart';
import 'package:zr_jin_page/theme/layout_tokens.dart';
import 'package:zr_jin_page/utilities/content_repository.dart';

import '../helpers/test_app.dart';

void main() {
  final List<dynamic> testItems = [
    {
      'venue': 'ICLR',
      'title': 'Compact Speech Publication',
      'link': 'https://example.com/speech',
      'author': 'A. Author',
      'year': '2025',
      'theme': 'Speech',
    },
    {
      'venue': 'medRxiv',
      'title': 'Sleep Publication',
      'link': 'https://example.com/sleep',
      'author': 'B. Author',
      'year': '2026',
      'theme': 'Sleep Medicine',
    },
  ];

  ContentRepository buildRepo() {
    return ContentRepository(
      client: MockClient(
        (_) async => http.Response(jsonEncode(testItems), 200),
      ),
    );
  }

  Future<void> pumpUntilFound(
    WidgetTester tester,
    Finder finder, {
    int maxPumps = 80,
  }) async {
    for (var i = 0; i < maxPumps; i++) {
      if (finder.evaluate().isNotEmpty) {
        return;
      }
      await tester.pump(const Duration(milliseconds: 100));
    }
    fail(
      'Expected finder to match at least one widget, but it never appeared.',
    );
  }

  testWidgets('SelectedPubCard loads local content in compact layout', (
    WidgetTester tester,
  ) async {
    await pumpCard(
      tester,
      SelectedPubCard(
        layout: LayoutTokens.compact(),
        loadCachedList: (_) async => testItems,
        repository: buildRepo(),
      ),
      width: 430,
    );

    expect(find.byType(LinearProgressIndicator), findsOneWidget);

    await pumpUntilFound(tester, find.byType(ChoiceChip));

    expect(find.text('Selected Publications'), findsOneWidget);
    expect(find.text('Theme'), findsOneWidget);
    expect(find.text('Showing 1 publication in Speech'), findsOneWidget);
    expect(find.byType(ChoiceChip), findsWidgets);

    final sleepChip = find.widgetWithText(ChoiceChip, 'Sleep Medicine');
    expect(sleepChip, findsOneWidget);
    final sleepChipWidget = tester.widget<ChoiceChip>(sleepChip);
    sleepChipWidget.onSelected?.call(true);
    await tester.pump(const Duration(milliseconds: 350));

    expect(
      find.text('Showing 1 publication in Sleep Medicine'),
      findsOneWidget,
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('SelectedPubCard renders in regular layout', (
    WidgetTester tester,
  ) async {
    await pumpCard(
      tester,
      SelectedPubCard(
        layout: LayoutTokens.regular(),
        loadCachedList: (_) async => testItems,
        repository: buildRepo(),
      ),
      width: 1024,
    );

    await pumpUntilFound(tester, find.byType(ChoiceChip));

    expect(find.text('Selected Publications'), findsOneWidget);
    expect(find.text('Theme'), findsOneWidget);
    expect(find.text('Showing 1 publication in Speech'), findsOneWidget);
    expect(find.byType(ChoiceChip), findsWidgets);
    expect(tester.takeException(), isNull);
  });
}
