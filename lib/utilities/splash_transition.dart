import 'dart:ui';

import 'package:flutter/material.dart';

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
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1600),
    vsync: this,
    // Preserve progress while the page is in a background tab so the
    // animation completes once the tab becomes visible again.
    animationBehavior: AnimationBehavior.preserve,
  );

  @override
  void initState() {
    super.initState();
    Future<void>.delayed(widget.startDelay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
