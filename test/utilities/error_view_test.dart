import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:zr_jin_page/utilities/error_view.dart';

import '../helpers/test_app.dart';

class _ErrorViewHost extends StatelessWidget {
  const _ErrorViewHost({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return buildErrorView(context, message);
  }
}

void main() {
  testWidgets('buildErrorView renders warning icon and error message', (
    WidgetTester tester,
  ) async {
    await pumpTestApp(
      tester,
      const _ErrorViewHost(message: 'Something went wrong'),
    );

    expect(find.byIcon(Icons.warning), findsOneWidget);
    expect(find.text('Something went wrong'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
