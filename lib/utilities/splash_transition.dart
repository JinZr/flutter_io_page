import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:zr_jin_page/utilities/splash_visit_storage.dart';

/// A Material motion inspired splash experience that morphs into the provided
/// [home] widget.
class SplashToHome extends StatefulWidget {
  const SplashToHome({
    super.key,
    required this.home,
    this.startDelay = const Duration(milliseconds: 320),
  });

  /// The widget revealed once the splash animation completes.
  final Widget home;

  /// Optional pause before the reveal animation begins.
  final Duration startDelay;

  @override
  State<SplashToHome> createState() => _SplashToHomeState();
}

class _SplashToHomeState extends State<SplashToHome>
    with SingleTickerProviderStateMixin {
  static const String _headerAsset = 'assets/images/header.webp';
  static const List<String> _polaroidAssets = [
    'assets/images/egs/egs1.webp',
    'assets/images/egs/egs2.webp',
    'assets/images/egs/egs3.webp',
    'assets/images/egs/egs4.webp',
    'assets/images/egs/egs5.webp',
    'assets/images/egs/egs6.webp',
    'assets/images/egs/egs7.webp',
    'assets/images/egs/egs8.webp',
  ];

  late final SplashVisitStorage _visitStorage = getSplashVisitStorage();
  late final bool _shouldShowSplash = _determineShouldShowSplash();
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1600),
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _precacheImportantImages();
      }
    });
    if (_shouldShowSplash) {
      Future<void>.delayed(widget.startDelay, () {
        if (mounted) {
          _controller.forward();
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _precacheImportantImages() async {
    final mediaQuery = MediaQuery.maybeOf(context);
    final view = View.of(context);
    final devicePixelRatio =
        mediaQuery?.devicePixelRatio ?? view.devicePixelRatio;
    final screenWidth =
        mediaQuery?.size.width ?? (view.physicalSize.width / devicePixelRatio);

    final headerProvider = ResizeImage(
      const AssetImage(_headerAsset),
      width: math.max(1, (screenWidth * devicePixelRatio).round()),
    );
    final galleryHeightPx = math.max(1, (400 * devicePixelRatio).round());

    final futures = <Future<void>>[
      precacheImage(headerProvider, context),
      for (final asset in _polaroidAssets)
        precacheImage(
          ResizeImage(AssetImage(asset), height: galleryHeightPx),
          context,
        ),
    ];

    await Future.wait(futures);
  }

  bool _determineShouldShowSplash() {
    if (_visitStorage.hasSeenSplash) {
      return false;
    }
    _visitStorage.markSplashSeen();
    return true;
  }

  double _curvedInterval(
    double value,
    double begin,
    double end, {
    Curve curve = Curves.linear,
  }) {
    assert(begin < end, 'The interval begin must be less than end.');
    if (value <= begin) {
      return 0;
    }
    if (value >= end) {
      return 1;
    }
    final double normalized = (value - begin) / (end - begin);
    return curve.transform(normalized.clamp(0.0, 1.0));
  }

  @override
  Widget build(BuildContext context) {
    if (!_shouldShowSplash) {
      return widget.home;
    }
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return AnimatedBuilder(
      animation: _controller,
      child: widget.home,
      builder: (BuildContext context, Widget? child) {
        final double animationValue = Curves.easeInOutCubic.transform(
          _controller.value,
        );
        final bool animationFinished = _controller.value >= 0.999;

        final double homeOpacity = _curvedInterval(
          _controller.value,
          0.32,
          1.0,
          curve: Curves.easeOutCubic,
        );
        final double overlayOpacity =
            1 -
            _curvedInterval(_controller.value, 0.62, 1.0, curve: Curves.easeIn);
        final EdgeInsetsGeometry padding = EdgeInsets.lerp(
          const EdgeInsets.symmetric(horizontal: 72.0, vertical: 160.0),
          EdgeInsets.zero,
          animationValue,
        )!;
        final BorderRadiusGeometry borderRadius = BorderRadius.lerp(
          BorderRadius.circular(28.0),
          BorderRadius.zero,
          animationValue,
        )!;
        final double elevation = lerpDouble(16.0, 0.0, animationValue)!;
        final double headlineOpacity =
            1 -
            _curvedInterval(
              _controller.value,
              0.4,
              0.85,
              curve: Curves.easeOutCubic,
            );
        final double progressOpacity =
            1 -
            _curvedInterval(
              _controller.value,
              0.52,
              0.85,
              curve: Curves.easeOutCubic,
            );

        return Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: IgnorePointer(
                ignoring: homeOpacity < 1,
                child: Opacity(opacity: homeOpacity, child: child),
              ),
            ),
            if (!animationFinished)
              Positioned.fill(
                child: IgnorePointer(
                  ignoring: true,
                  child: Opacity(
                    opacity: overlayOpacity,
                    child: ColoredBox(
                      color: colorScheme.surface,
                      child: Padding(
                        padding: padding,
                        child: Align(
                          alignment: Alignment.center,
                          child: Material(
                            color: colorScheme.primary,
                            elevation: elevation,
                            borderRadius: borderRadius,
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 360),
                              child: Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Opacity(
                                      opacity: headlineOpacity,
                                      child: Text(
                                        'Welcome',
                                        style: textTheme.headlineSmall
                                            ?.copyWith(
                                              color: colorScheme.onPrimary,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    const SizedBox(height: 24),
                                    Opacity(
                                      opacity: progressOpacity,
                                      child: Semantics(
                                        label: 'Loading home page',
                                        liveRegion: true,
                                        child: LinearProgressIndicator(
                                          minHeight: 4,
                                          backgroundColor: colorScheme.onPrimary
                                              .withValues(alpha: 0.2),
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                colorScheme.onPrimary,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
