import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import 'package:zr_jin_page/home_components/academic_service_card.dart';
import 'package:zr_jin_page/theme/layout_tokens.dart';
import 'package:zr_jin_page/utilities/content_repository.dart';

import '../helpers/test_app.dart';

void main() {
  final List<dynamic> testServices = [
    {
      'role': 'Local Arrangement Chair',
      'organization': 'RLChina',
      'location': 'Beijing, China',
      'year': '2025',
      'link': 'https://example.com/rlchina',
    },
    {
      'role': 'Operations Chair',
      'organization': 'ICASSP Satellite Event',
      'location': 'Suzhou, China',
      'year': '2025',
      'link': 'https://example.com/icassp',
    },
  ];

  ContentRepository buildRepo() {
    return ContentRepository(
      client: MockClient(
        (_) async => http.Response(jsonEncode(testServices), 200),
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

  testWidgets('AcademicServiceCard loads content in compact layout', (
    WidgetTester tester,
  ) async {
    await pumpCard(
      tester,
      AcademicServiceCard(
        layout: LayoutTokens.compact(),
        loadCachedList: (_) async => testServices,
        repository: buildRepo(),
      ),
      width: 430,
    );

    expect(find.byType(LinearProgressIndicator), findsOneWidget);

    await pumpUntilFound(tester, find.text('Service roles'));

    expect(find.text('Academic Service'), findsOneWidget);
    expect(find.text('Service roles'), findsOneWidget);
    expect(find.textContaining('Local Arrangement Chair'), findsWidgets);
    expect(find.textContaining('2025'), findsWidgets);
    expect(tester.takeException(), isNull);
  });

  testWidgets('AcademicServiceCard renders in regular layout', (
    WidgetTester tester,
  ) async {
    await pumpCard(
      tester,
      AcademicServiceCard(
        layout: LayoutTokens.regular(),
        loadCachedList: (_) async => testServices,
        repository: buildRepo(),
      ),
      width: 1024,
    );

    await pumpUntilFound(tester, find.text('Service roles'));

    expect(find.text('Academic Service'), findsOneWidget);
    expect(find.text('Service roles'), findsOneWidget);
    expect(find.textContaining('RLChina'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
