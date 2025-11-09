import 'package:flutter/material.dart';

import '../home.dart';
import '../utilities/author_name.dart';

class SplashToHome extends StatefulWidget {
  const SplashToHome({super.key});

  @override
  State<SplashToHome> createState() => _SplashToHomeState();
}

class _SplashToHomeState extends State<SplashToHome> {
  bool _showSplash = true;

  void _handleSplashFinished() {
    if (!_showSplash) {
      return;
    }

    setState(() {
      _showSplash = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 700),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInOutCubic,
      transitionBuilder: (child, animation) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
          reverseCurve: Curves.easeInCubic,
        );

        return FadeTransition(
          opacity: curvedAnimation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.96, end: 1.0).animate(curvedAnimation),
            child: child,
          ),
        );
      },
      child: _showSplash
          ? MaterialSplashScreen(
              key: const ValueKey('splash'),
              onFinished: _handleSplashFinished,
            )
          : const _HomeShell(key: ValueKey('home')),
    );
  }
}

class _HomeShell extends StatelessWidget {
  const _HomeShell({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1200),
      child: const MyHomePage(
        titleEn: AUTHOR_TEXT,
        titleZh: '金增锐',
      ),
    );
  }
}

class MaterialSplashScreen extends StatefulWidget {
  const MaterialSplashScreen({
    super.key,
    required this.onFinished,
  });

  final VoidCallback onFinished;

  @override
  State<MaterialSplashScreen> createState() => _MaterialSplashScreenState();
}

class _MaterialSplashScreenState extends State<MaterialSplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _cardOpacity;
  late final Animation<double> _cardScale;
  late final Animation<double> _glowStrength;
  bool _didNotify = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _cardOpacity = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.75, curve: Curves.easeOutCubic),
      reverseCurve: Curves.easeInCubic,
    );

    _cardScale = Tween<double>(begin: 0.92, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
        reverseCurve: Curves.easeInBack,
      ),
    );

    _glowStrength = Tween<double>(begin: 0.25, end: 0.55).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 1.0, curve: Curves.easeOut),
      ),
    );

    _controller
      ..forward()
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future<void>.delayed(const Duration(milliseconds: 240), () {
            if (mounted) {
              _notifyFinished();
            }
          });
        }
      });
  }

  void _notifyFinished() {
    if (_didNotify) {
      return;
    }

    _didNotify = true;
    widget.onFinished();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: colorScheme.surface,
      child: AnimatedBuilder(
        animation: _glowStrength,
        builder: (context, child) {
          return DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  colorScheme.primaryContainer
                      .withValues(alpha: _glowStrength.value),
                  colorScheme.surface,
                ],
              ),
            ),
            child: child,
          );
        },
        child: Center(
          child: FadeTransition(
            opacity: _cardOpacity,
            child: ScaleTransition(
              scale: _cardScale,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 360),
                child: Card(
                  elevation: 12,
                  color: colorScheme.surfaceContainerHigh,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 40,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                colorScheme.primary,
                                colorScheme.primaryContainer,
                              ],
                            ),
                          ),
                          child: SizedBox(
                            width: 72,
                            height: 72,
                            child: Icon(
                              Icons.flutter_dash,
                              color: colorScheme.onPrimary,
                              size: 40,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          AUTHOR_TEXT,
                          style: textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Crafting a tailored experience…',
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 28),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(999),
                          child: LinearProgressIndicator(
                            minHeight: 4,
                            backgroundColor:
                                colorScheme.surfaceContainerHighest,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              colorScheme.primary,
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
    );
  }
}
