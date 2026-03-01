import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:zr_jin_page/home_components/polaroid_card.dart';
import 'package:zr_jin_page/theme/layout_tokens.dart';
import 'package:zr_jin_page/utilities/lazy_asset_image.dart';

import 'helpers/test_app.dart';

class _PolaroidCardRebuildHost extends StatefulWidget {
  const _PolaroidCardRebuildHost();

  @override
  State<_PolaroidCardRebuildHost> createState() =>
      _PolaroidCardRebuildHostState();
}

class _PolaroidCardRebuildHostState extends State<_PolaroidCardRebuildHost> {
  int _rebuildCount = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
          key: const ValueKey('polaroid-rebuild-button'),
          onPressed: () {
            setState(() {
              _rebuildCount += 1;
            });
          },
          child: Text('Rebuild $_rebuildCount'),
        ),
        PolaroidCard(layout: LayoutTokens.regular()),
      ],
    );
  }
}

void main() {
  testWidgets('uses same description typography in compact and regular layouts', (
    WidgetTester tester,
  ) async {
    const descriptionText =
        'I have one Polaroid Spectra for shooting B&W film, one SX-70 Sonar, and one SLR680 for regular shooting. My Polaroid camera collection also includes an SLR680 Special Edition (Blue Button Version), an SX-70 Model 2, a 670-AF, and a 670-AF Special Edition (also known as the Blue Button Version).';

    await pumpCard(
      tester,
      PolaroidCard(layout: LayoutTokens.compact()),
      width: 430,
    );

    final compactStyle = tester.widget<Text>(find.text(descriptionText)).style;
    final compactContext = tester.element(find.byType(PolaroidCard));
    final compactTextTheme = Theme.of(compactContext).textTheme;
    final expectedCompactFontSize =
        (compactTextTheme.bodyLarge ?? compactTextTheme.bodyMedium!)
            .fontSize;

    await pumpCard(
      tester,
      PolaroidCard(layout: LayoutTokens.regular()),
      width: 1024,
    );

    final regularStyle = tester.widget<Text>(find.text(descriptionText)).style;
    final regularContext = tester.element(find.byType(PolaroidCard));
    final regularTextTheme = Theme.of(regularContext).textTheme;
    final expectedRegularFontSize =
        (regularTextTheme.bodyLarge ?? regularTextTheme.bodyMedium!).fontSize;

    expect(compactStyle?.fontSize, expectedCompactFontSize);
    expect(regularStyle?.fontSize, expectedRegularFontSize);
  });

  testWidgets('keeps weighted carousel on narrow widths', (
    WidgetTester tester,
  ) async {
    await pumpCard(
      tester,
      PolaroidCard(layout: LayoutTokens.compact()),
      width: 430,
    );

    expect(find.text('Swipe to browse the gallery'), findsOneWidget);
    expect(find.byType(CarouselView), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('keeps weighted carousel on wider layouts', (
    WidgetTester tester,
  ) async {
    await pumpCard(
      tester,
      PolaroidCard(layout: LayoutTokens.regular()),
      width: 1024,
    );

    expect(find.text('Swipe to browse the gallery'), findsOneWidget);
    expect(find.byType(CarouselView), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('keeps carousel image cache dimensions stable while swiping', (
    WidgetTester tester,
  ) async {
    await pumpCard(
      tester,
      PolaroidCard(layout: LayoutTokens.regular()),
      width: 1024,
    );

    final beforeSwipeWidths = tester
        .widgetList<LazyAssetImage>(find.byType(LazyAssetImage))
        .map((LazyAssetImage image) => image.cacheWidth)
        .toSet();
    final beforeSwipeHeights = tester
        .widgetList<LazyAssetImage>(find.byType(LazyAssetImage))
        .map((LazyAssetImage image) => image.cacheHeight)
        .toSet();

    await tester.drag(find.byType(CarouselView), const Offset(-80, 0));
    await tester.pumpAndSettle();

    final afterSwipeWidths = tester
        .widgetList<LazyAssetImage>(find.byType(LazyAssetImage))
        .map((LazyAssetImage image) => image.cacheWidth)
        .toSet();
    final afterSwipeHeights = tester
        .widgetList<LazyAssetImage>(find.byType(LazyAssetImage))
        .map((LazyAssetImage image) => image.cacheHeight)
        .toSet();

    expect(beforeSwipeWidths.length, 1);
    expect(beforeSwipeHeights.length, 1);
    expect(afterSwipeWidths, beforeSwipeWidths);
    expect(afterSwipeHeights, beforeSwipeHeights);
    expect(tester.takeException(), isNull);
  });

  testWidgets('keeps carousel position across parent rebuilds', (
    WidgetTester tester,
  ) async {
    await pumpTestApp(
      tester,
      const Center(
        child: SizedBox(width: 1024, child: _PolaroidCardRebuildHost()),
      ),
      surfaceSize: const Size(1100, 1600),
    );

    final carouselFinder = find.byType(CarouselView);
    final controller = tester.widget<CarouselView>(carouselFinder).controller!;
    expect(controller.hasClients, isTrue);
    final initialOffset = controller.position.pixels;

    await tester.drag(carouselFinder, const Offset(-420, 0));
    await tester.pumpAndSettle();

    final swipedOffset = controller.position.pixels;
    expect(swipedOffset, greaterThan(initialOffset + 1));

    await tester.tap(find.byKey(const ValueKey('polaroid-rebuild-button')));
    await tester.pumpAndSettle();

    final rebuiltController = tester
        .widget<CarouselView>(carouselFinder)
        .controller!;
    expect(identical(rebuiltController, controller), isTrue);
    expect(controller.position.pixels, closeTo(swipedOffset, 0.01));
    expect(tester.takeException(), isNull);
  });
}
