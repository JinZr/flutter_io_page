import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'home_components/academic_service_card.dart' deferred as academic;
import 'home_components/card_entrance_wrapper.dart';
import 'home_components/contrib_card.dart' deferred as contrib;
import 'home_components/polaroid_card.dart' deferred as polaroid;
import 'home_components/selected_pub_card.dart' deferred as selected_pub;
import 'home_components/self_intro_card.dart';
import 'utilities/author_name.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.titleEn, required this.titleZh});

  final String titleEn;
  final String titleZh;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final Future<void> _selectedLibrary;
  late final Future<void> _academicLibrary;
  late final Future<void> _contribLibrary;
  late final Future<void> _polaroidLibrary;

  @override
  void initState() {
    super.initState();
    _selectedLibrary = _deferLibrary(selected_pub.loadLibrary);
    _academicLibrary = _deferLibrary(academic.loadLibrary);
    _contribLibrary = _deferLibrary(contrib.loadLibrary);
    _polaroidLibrary = _deferLibrary(polaroid.loadLibrary);
  }

  Future<void> _deferLibrary(Future<void> Function() loader) {
    if (!kIsWeb) {
      return Future.value();
    }
    final completer = Completer<void>();
    Future.microtask(() async {
      try {
        await loader();
        completer.complete();
      } catch (error, stackTrace) {
        completer.completeError(error, stackTrace);
      }
    });
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    // var screenWidth = MediaQuery.sizeOf(context).width;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final cardWidth = math.min(screenWidth, 1200.0);

    Widget animatedCard({required Widget child, required int index}) {
      return Center(
        child: HomeCardEntrance(
          delay: Duration(milliseconds: 120 * index),
          child: SizedBox(
            width: cardWidth,
            child: RepaintBoundary(child: child),
          ),
        ),
      );
    }

    return PopScope(
      canPop: !kIsWeb,
      child: Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => <Widget>[
                SliverAppBar.large(
                  floating: true,
                  pinned: true,
                  stretch: true,
                  forceElevated: innerBoxIsScrolled,
                  expandedHeight: 320.0,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  foregroundColor: Theme.of(context).colorScheme.onSurface,
                  surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
                  shadowColor: Theme.of(context).colorScheme.shadow,
                  scrolledUnderElevation: 4.0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(28.0),
                    ),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    stretchModes: const [
                      StretchMode.zoomBackground,
                      StretchMode.blurBackground,
                    ],
                    titlePadding: const EdgeInsetsDirectional.only(
                      start: 16.0,
                      bottom: 16.0,
                    ),
                    title: Text(
                      AUTHOR_TEXT,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          "assets/images/header.webp",
                          fit: BoxFit.cover,
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Theme.of(context).colorScheme.surfaceTint
                                    .withValues(alpha: 0.35),
                                Theme.of(
                                  context,
                                ).colorScheme.surface.withValues(alpha: 0.85),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
          body: ListView(
            children: [
              animatedCard(child: const IntroductionCard(), index: 0),
              animatedCard(
                child: _DeferredSection(
                  future: _selectedLibrary,
                  placeholderHeight: 280,
                  builder: () => selected_pub.SelectedPubCard(),
                ),
                index: 1,
              ),
              animatedCard(
                child: _DeferredSection(
                  future: _contribLibrary,
                  placeholderHeight: 200,
                  builder: () => contrib.ContribCard(),
                ),
                index: 2,
              ),
              animatedCard(
                child: _DeferredSection(
                  future: _academicLibrary,
                  placeholderHeight: 260,
                  builder: () => academic.AcademicServiceCard(),
                ),
                index: 3,
              ),
              animatedCard(
                child: _DeferredSection(
                  future: _polaroidLibrary,
                  placeholderHeight: 420,
                  builder: () => polaroid.PolaroidCard(),
                ),
                index: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DeferredSection extends StatelessWidget {
  const _DeferredSection({
    required this.future,
    required this.builder,
    required this.placeholderHeight,
  });

  final Future<void> future;
  final Widget Function() builder;
  final double placeholderHeight;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return builder();
        }
        if (snapshot.hasError) {
          return Card(
            child: SizedBox(
              height: placeholderHeight,
              child: Center(
                child: Text(
                  'Section failed to load.',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }
        return _DeferredPlaceholder(height: placeholderHeight);
      },
    );
  }
}

class _DeferredPlaceholder extends StatelessWidget {
  const _DeferredPlaceholder({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: height,
        child: const Center(
          child: SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(strokeWidth: 2.2),
          ),
        ),
      ),
    );
  }
}
