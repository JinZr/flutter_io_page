import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'dart:math' as math;

import 'home_components/academic_service_card.dart'
    deferred as academic_service;
import 'home_components/card_entrance_wrapper.dart';
import 'home_components/card_placeholder.dart';
import 'home_components/contrib_card.dart' deferred as contrib;
import 'home_components/polaroid_card.dart' deferred as polaroid;
import 'home_components/selected_pub_card.dart' deferred as selected_pub;
import 'home_components/self_intro_card.dart';
import 'utilities/author_name.dart';
import 'utilities/deferred_widget.dart';
import 'utilities/link_toolbar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.titleEn, required this.titleZh});

  final String titleEn;
  final String titleZh;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _toolbarFloating = false;

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.metrics.axis != Axis.vertical) {
      return false;
    }
    final bool shouldFloat = notification.metrics.pixels > 0;
    if (shouldFloat != _toolbarFloating) {
      setState(() => _toolbarFloating = shouldFloat);
    }
    return false;
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
          child: RepaintBoundary(
            child: SizedBox(width: cardWidth, child: child),
          ),
        ),
      );
    }

    return PopScope(
      canPop: !kIsWeb,
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: LinkToolbar(floating: _toolbarFloating),
        body: NotificationListener<ScrollNotification>(
          onNotification: _handleScrollNotification,
          child: NestedScrollView(
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
                  child: DeferredWidget(
                    libraryLoader: selected_pub.loadLibrary,
                    placeholder: const CardPlaceholder(minHeight: 220),
                    builder: (_) => selected_pub.SelectedPubCard(),
                  ),
                  index: 1,
                ),
                animatedCard(
                  child: DeferredWidget(
                    libraryLoader: contrib.loadLibrary,
                    placeholder: const CardPlaceholder(minHeight: 220),
                    builder: (_) => contrib.ContribCard(),
                  ),
                  index: 2,
                ),
                animatedCard(
                  child: DeferredWidget(
                    libraryLoader: academic_service.loadLibrary,
                    placeholder: const CardPlaceholder(minHeight: 220),
                    builder: (_) => academic_service.AcademicServiceCard(),
                  ),
                  index: 3,
                ),
                animatedCard(
                  child: DeferredWidget(
                    libraryLoader: polaroid.loadLibrary,
                    placeholder: const CardPlaceholder(minHeight: 320),
                    builder: (_) => polaroid.PolaroidCard(),
                  ),
                  index: 4,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Center(
                    child: Text(
                      'This site is proudly powered by Flutter and composed by Zengrui Jin.',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
