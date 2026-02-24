import 'package:flutter/material.dart';

import 'package:zr_jin_page/theme/layout_tokens.dart';
import 'package:zr_jin_page/utilities/lazy_asset_image.dart';

int? _cacheDimensionFor(double logicalDimension, double pixelRatio) {
  if (!logicalDimension.isFinite || logicalDimension <= 0) {
    return null;
  }
  return (logicalDimension * pixelRatio).round();
}

class PolaroidCard extends StatefulWidget {
  const PolaroidCard({super.key, required this.layout});

  final LayoutTokens layout;

  static const List<Map<String, String>> _images = [
    {"image": "assets/images/egs/egs1.webp", "title": "Dalian"},
    {"image": "assets/images/egs/egs2.webp", "title": "Dalian"},
    {"image": "assets/images/egs/egs3.webp", "title": "Dalian"},
    {"image": "assets/images/egs/egs4.webp", "title": "Dalian"},
    {"image": "assets/images/egs/egs5.webp", "title": "Hong Kong SAR"},
    {"image": "assets/images/egs/egs6.webp", "title": "Hong Kong SAR"},
    {"image": "assets/images/egs/egs7.webp", "title": "Hong Kong SAR"},
    {"image": "assets/images/egs/egs8.webp", "title": "Hong Kong SAR"},
  ];

  @override
  State<PolaroidCard> createState() => _PolaroidCardState();
}

class _PolaroidCardState extends State<PolaroidCard> {
  late final CarouselController _carouselController;

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselController(initialItem: 1);
  }

  @override
  void dispose() {
    _carouselController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final layout = widget.layout;
    final contentPadding = theme.listTileTheme.contentPadding?.resolve(
      Directionality.of(context),
    );
    final headerIndent = contentPadding?.left ?? 16.0;
    final horizontalPadding = layout.cardPaddingHorizontal;
    final topPadding = layout.cardPaddingTop;
    final bottomPadding = layout.cardPaddingBottom;
    final sectionGap = layout.sectionGap;
    final galleryHeight = 400.0;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            leading: const Icon(Icons.camera),
            title: Text("My Polaroid Gallery", style: textTheme.titleLarge!),
          ),
          Divider(indent: headerIndent),
          Padding(
            padding: EdgeInsets.fromLTRB(
              horizontalPadding,
              topPadding,
              horizontalPadding,
              bottomPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _GallerySectionContainer(
                  layout: layout,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      layout.sectionInsetHorizontal,
                      layout.cardPaddingTop,
                      layout.sectionInsetHorizontal,
                      layout.sectionInsetHorizontal,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Swipe to browse the gallery',
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        SizedBox(height: layout.cardPaddingTop),
                        SizedBox(
                          width: double.maxFinite,
                          height: galleryHeight,
                          child: LayoutBuilder(
                            builder:
                                (
                                  BuildContext context,
                                  BoxConstraints constraints,
                                ) {
                                  final pixelRatio =
                                      MediaQuery.devicePixelRatioOf(context);
                                  final carouselCacheWidth = _cacheDimensionFor(
                                    constraints.maxWidth,
                                    pixelRatio,
                                  );
                                  final carouselCacheHeight =
                                      _cacheDimensionFor(
                                        galleryHeight,
                                        pixelRatio,
                                      );

                                  return CarouselView.weightedBuilder(
                                    controller: _carouselController,
                                    itemSnapping: true,
                                    enableSplash: false,
                                    flexWeights: const <int>[1, 2, 1],
                                    itemCount: PolaroidCard._images.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                          final image =
                                              PolaroidCard._images[index];
                                          final imagePath = image["image"]!;
                                          return _PolaroidGalleryImage(
                                            key: ValueKey(imagePath),
                                            imagePath: imagePath,
                                            title: image["title"]!,
                                            layout: layout,
                                            cacheWidth: carouselCacheWidth,
                                            cacheHeight: carouselCacheHeight,
                                          );
                                        },
                                  );
                                },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: sectionGap),
                _GallerySectionContainer(
                  layout: layout,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      layout.cardInnerHorizontal,
                      layout.cardInnerVertical,
                      layout.cardInnerHorizontal,
                      layout.cardInnerVertical,
                    ),
                    child: Text(
                      "I have one Polaroid Spectra for shooting B&W film, one SX-70 Sonar, and one SLR680 for regular shooting. My Polaroid camera collection also includes an SLR680 Special Edition (Blue Button Version), an SX-70 Model 2, a 670-AF, and a 670-AF Special Edition (also known as the Blue Button Version).",
                      style: textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GallerySectionContainer extends StatelessWidget {
  const _GallerySectionContainer({required this.layout, required this.child});

  final LayoutTokens layout;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(layout.radiusContainer),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.55),
        ),
      ),
      child: child,
    );
  }
}

class _PolaroidGalleryImage extends StatelessWidget {
  const _PolaroidGalleryImage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.layout,
    this.cacheWidth,
    this.cacheHeight,
  });

  final String imagePath;
  final String title;
  final LayoutTokens layout;
  final int? cacheWidth;
  final int? cacheHeight;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final BorderRadius borderRadius = BorderRadius.circular(layout.radiusMedia);

    return Semantics(
      button: true,
      label: 'Open full image for $title',
      child: Tooltip(
        message: 'Open full image',
        child: Material(
          color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.25),
          borderRadius: borderRadius,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  fullscreenDialog: true,
                  builder: (BuildContext context) => _PolaroidImageViewer(
                    imagePath: imagePath,
                    title: title,
                    layout: layout,
                  ),
                ),
              );
            },
            child: _GalleryImageContent(
              imagePath: imagePath,
              cacheWidth: cacheWidth,
              cacheHeight: cacheHeight,
            ),
          ),
        ),
      ),
    );
  }
}

class _GalleryImageContent extends StatelessWidget {
  const _GalleryImageContent({
    required this.imagePath,
    this.cacheWidth,
    this.cacheHeight,
  });

  final String imagePath;
  final int? cacheWidth;
  final int? cacheHeight;

  @override
  Widget build(BuildContext context) {
    final image = _PolaroidAssetImage(
      assetName: imagePath,
      fit: BoxFit.cover,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
    return Hero(tag: imagePath, child: image);
  }
}

class _PolaroidImageViewer extends StatelessWidget {
  const _PolaroidImageViewer({
    required this.imagePath,
    required this.title,
    required this.layout,
  });

  final String imagePath;
  final String title;
  final LayoutTokens layout;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Close image',
        onPressed: () => Navigator.of(context).maybePop(),
        child: const Icon(Icons.close),
      ),
      body: Stack(
        children: [
          InteractiveViewer(
            minScale: 1.0,
            maxScale: 4.0,
            child: SizedBox.expand(
              child: Center(child: _ViewerImageContent(imagePath: imagePath)),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                layout.cardPaddingHorizontal,
                layout.xl,
                layout.cardPaddingHorizontal,
                0,
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Chip(
                  avatar: const Icon(Icons.place_outlined, size: 18),
                  label: Text(title),
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.symmetric(
                    horizontal: layout.md,
                    vertical: layout.xs,
                  ),
                  backgroundColor: colorScheme.secondaryContainer,
                  side: BorderSide(color: colorScheme.secondary),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ViewerImageContent extends StatelessWidget {
  const _ViewerImageContent({required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final image = _PolaroidAssetImage(
      assetName: imagePath,
      fit: BoxFit.contain,
    );
    return Hero(tag: imagePath, child: image);
  }
}

class _PolaroidAssetImage extends StatelessWidget {
  const _PolaroidAssetImage({
    required this.assetName,
    required this.fit,
    this.cacheWidth,
    this.cacheHeight,
  });

  final String assetName;
  final BoxFit fit;
  final int? cacheWidth;
  final int? cacheHeight;

  @override
  Widget build(BuildContext context) {
    if (cacheWidth != null || cacheHeight != null) {
      return LazyAssetImage(
        assetName: assetName,
        fit: fit,
        filterQuality: FilterQuality.medium,
        cacheWidth: cacheWidth,
        cacheHeight: cacheHeight,
        errorBuilder: (BuildContext context, Object error, StackTrace? trace) =>
            ColoredBox(
              color: Theme.of(context).colorScheme.surfaceContainerHigh,
            ),
      );
    }

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final size = MediaQuery.sizeOf(context);
        final pixelRatio = MediaQuery.devicePixelRatioOf(context);
        final logicalWidth = constraints.hasBoundedWidth
            ? constraints.maxWidth
            : size.width;
        final logicalHeight = constraints.hasBoundedHeight
            ? constraints.maxHeight
            : size.height;

        return LazyAssetImage(
          assetName: assetName,
          fit: fit,
          filterQuality: FilterQuality.medium,
          cacheWidth: _cacheDimensionFor(logicalWidth, pixelRatio),
          cacheHeight: _cacheDimensionFor(logicalHeight, pixelRatio),
          errorBuilder:
              (BuildContext context, Object error, StackTrace? trace) =>
                  ColoredBox(
                    color: Theme.of(context).colorScheme.surfaceContainerHigh,
                  ),
        );
      },
    );
  }
}
