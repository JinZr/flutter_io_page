import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:zr_jin_page/utilities/lazy_asset_image.dart';

import '../helpers/test_app.dart';

void main() {
  testWidgets(
    'LazyAssetImage renders scroll-aware resized provider with configured fit',
    (WidgetTester tester) async {
      await pumpTestApp(
        tester,
        const SizedBox(
          width: 360,
          height: 240,
          child: LazyAssetImage(
            assetName: 'assets/images/header.webp',
            fit: BoxFit.cover,
            cacheWidth: 320,
            cacheHeight: 180,
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
      expect(image.image, isA<ScrollAwareImageProvider<Object>>());

      final provider = image.image as ScrollAwareImageProvider<Object>;
      expect(provider.imageProvider, isA<ResizeImage>());
      final resized = provider.imageProvider as ResizeImage;
      expect(resized.width, 320);
      expect(resized.height, 180);
      expect(tester.takeException(), isNull);
    },
  );
}
