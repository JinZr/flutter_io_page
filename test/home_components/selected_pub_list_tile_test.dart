import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:zr_jin_page/home_components/selected_pub_list_tile.dart';
import 'package:zr_jin_page/theme/layout_tokens.dart';

import '../helpers/test_app.dart';

void main() {
  testWidgets('SelectedPubListTile shows metadata when present', (
    WidgetTester tester,
  ) async {
    const json = {
      'title': 'A Test Publication',
      'author': 'Author A, Author B',
      'venue': 'ICLR',
      'year': '2026',
      'link': 'https://example.com',
    };

    await pumpCard(
      tester,
      SelectedPubListTile(json: json, layout: LayoutTokens.regular()),
      width: 1024,
    );

    expect(find.text('A Test Publication'), findsOneWidget);
    expect(find.text('Author A, Author B'), findsOneWidget);
    expect(find.text('ICLR'), findsOneWidget);
    expect(find.text('2026'), findsOneWidget);
    expect(find.byIcon(Icons.auto_stories_outlined), findsOneWidget);
    expect(find.byIcon(Icons.calendar_today_outlined), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('SelectedPubListTile falls back safely for sparse data', (
    WidgetTester tester,
  ) async {
    const json = {'link': ''};

    await pumpCard(
      tester,
      SelectedPubListTile(json: json, layout: LayoutTokens.compact()),
      width: 430,
    );

    expect(find.text('Untitled publication'), findsOneWidget);
    expect(find.text('ICLR'), findsNothing);
    expect(find.byIcon(Icons.auto_stories_outlined), findsNothing);
    expect(tester.takeException(), isNull);
  });
}
