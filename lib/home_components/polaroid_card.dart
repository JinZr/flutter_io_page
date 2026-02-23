import 'package:flutter/material.dart';

import 'package:zr_jin_page/theme/layout_tokens.dart';

class PolaroidCard extends StatelessWidget {
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

  static String _jpegFallbackFor(String webpAssetPath) {
    return webpAssetPath
        .replaceFirst('assets/images/egs/', 'assets/images/egs_jpg/')
        .replaceFirst('.webp', '.jpg');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final isCompact = layout.isCompact;
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
                          isCompact
                              ? 'Tap an image to open it full screen'
                              : 'Swipe to browse the gallery',
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        SizedBox(height: layout.cardPaddingTop),
                        if (isCompact)
                          _PolaroidGalleryGrid(images: _images, layout: layout)
                        else
                          SizedBox(
                            width: double.maxFinite,
                            height: galleryHeight,
                            child: CarouselView.weightedBuilder(
                              // Keep carousel behavior unchanged on wider layouts.
                              controller: CarouselController(initialItem: 1),
                              itemSnapping: true,
                              enableSplash: false,
                              flexWeights: const <int>[1, 2, 1],
                              itemCount: _images.length,
                              itemBuilder: (BuildContext context, int index) {
                                final image = _images[index];
                                return _PolaroidGalleryImage(
                                  imagePath: image["image"]!,
                                  fallbackImagePath: _jpegFallbackFor(
                                    image["image"]!,
                                  ),
                                  title: image["title"]!,
                                  layout: layout,
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

class _PolaroidGalleryGrid extends StatelessWidget {
  const _PolaroidGalleryGrid({required this.images, required this.layout});

  final List<Map<String, String>> images;
  final LayoutTokens layout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final crossAxisCount = constraints.maxWidth < 560 ? 2 : 3;
        return GridView.builder(
          itemCount: images.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: layout.md,
            mainAxisSpacing: layout.md,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (BuildContext context, int index) {
            final image = images[index];
            return _PolaroidGalleryImage(
              imagePath: image["image"]!,
              fallbackImagePath: PolaroidCard._jpegFallbackFor(image["image"]!),
              title: image["title"]!,
              layout: layout,
            );
          },
        );
      },
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
    required this.imagePath,
    required this.fallbackImagePath,
    required this.title,
    required this.layout,
  });

  final String imagePath;
  final String fallbackImagePath;
  final String title;
  final LayoutTokens layout;

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
                    fallbackImagePath: fallbackImagePath,
                    title: title,
                    layout: layout,
                  ),
                ),
              );
            },
            child: Hero(
              tag: imagePath,
              child: _PolaroidAssetImage(
                primaryAssetName: imagePath,
                fallbackAssetName: fallbackImagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PolaroidImageViewer extends StatelessWidget {
  const _PolaroidImageViewer({
    required this.imagePath,
    required this.fallbackImagePath,
    required this.title,
    required this.layout,
  });

  final String imagePath;
  final String fallbackImagePath;
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
              child: Center(
                child: Hero(
                  tag: imagePath,
                  child: _PolaroidAssetImage(
                    primaryAssetName: imagePath,
                    fallbackAssetName: fallbackImagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
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

class _PolaroidAssetImage extends StatelessWidget {
  const _PolaroidAssetImage({
    required this.primaryAssetName,
    required this.fallbackAssetName,
    required this.fit,
  });

  final String primaryAssetName;
  final String fallbackAssetName;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      primaryAssetName,
      fit: fit,
      filterQuality: FilterQuality.medium,
      errorBuilder:
          (BuildContext context, Object error, StackTrace? stackTrace) {
            return Image.asset(
              fallbackAssetName,
              fit: fit,
              filterQuality: FilterQuality.medium,
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                    return const _PolaroidImageErrorPlaceholder();
                  },
            );
          },
    );
  }
}

class _PolaroidImageErrorPlaceholder extends StatelessWidget {
  const _PolaroidImageErrorPlaceholder();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ColoredBox(
      color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.35),
      child: Icon(
        Icons.broken_image_outlined,
        color: colorScheme.onSurfaceVariant,
      ),
    );
  }
}
