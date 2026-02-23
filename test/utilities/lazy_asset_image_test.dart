import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:zr_jin_page/utilities/lazy_asset_image.dart';

import '../helpers/test_app.dart';

void main() {
  testWidgets('LazyAssetImage eventually renders Image with configured fit', (
    WidgetTester tester,
  ) async {
    await pumpTestApp(
      tester,
      const SizedBox(
        width: 360,
        height: 240,
        child: LazyAssetImage(
          assetName: 'assets/images/header.webp',
          fit: BoxFit.cover,
          placeholder: ColoredBox(color: Colors.amber),
        ),
      ),
      surfaceSize: const Size(430, 932),
    );

    await tester.pumpAndSettle();

    final imageFinder = find.byType(Image);
    expect(imageFinder, findsOneWidget);

    final image = tester.widget<Image>(imageFinder);
    expect(image.fit, BoxFit.cover);
    expect(tester.takeException(), isNull);
  });
}
