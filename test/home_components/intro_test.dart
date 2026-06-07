import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:zr_jin_page/home_components/intro.dart';

import '../helpers/test_app.dart';

void main() {
  testWidgets('MyIntroduction renders rich text content', (
    WidgetTester tester,
  ) async {
    await pumpTestApp(
      tester,
      const Padding(padding: EdgeInsets.all(16), child: MyIntroduction()),
      scrollable: true,
    );

    final richText = tester.widget<RichText>(find.byType(RichText));
    final fullText = richText.text.toPlainText();

    expect(fullText, contains('Prof. Xunying Liu'));
    expect(fullText, contains('Prof. Chao Zhang'));
    expect(tester.takeException(), isNull);
  });
}
