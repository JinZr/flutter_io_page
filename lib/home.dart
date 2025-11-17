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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.titleEn, required this.titleZh});

  final String titleEn;
  final String titleZh;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final cardWidth = math.min(screenWidth, 1200.0);
    final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
    final headerCacheWidth = math.max(
      1,
      (screenWidth * devicePixelRatio).round(),
    );

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

    final sectionBuilders = <WidgetBuilder>[
      (_) => animatedCard(child: const IntroductionCard(), index: 0),
      (_) => animatedCard(
        child: DeferredWidget(
          libraryLoader: selected_pub.loadLibrary,
          placeholder: const CardPlaceholder(minHeight: 220),
          builder: (_) => selected_pub.SelectedPubCard(),
        ),
        index: 1,
      ),
      (_) => animatedCard(
        child: DeferredWidget(
          libraryLoader: contrib.loadLibrary,
          placeholder: const CardPlaceholder(minHeight: 220),
          builder: (_) => contrib.ContribCard(),
        ),
        index: 2,
      ),
      (_) => animatedCard(
        child: DeferredWidget(
          libraryLoader: academic_service.loadLibrary,
          placeholder: const CardPlaceholder(minHeight: 220),
          builder: (_) => academic_service.AcademicServiceCard(),
        ),
        index: 3,
      ),
      (_) => animatedCard(
        child: DeferredWidget(
          libraryLoader: polaroid.loadLibrary,
          placeholder: const CardPlaceholder(minHeight: 320),
          builder: (_) => polaroid.PolaroidCard(),
        ),
        index: 4,
      ),
      (context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Center(
          child: Text(
            'This site is proudly powered by Flutter and composed by Zengrui Jin.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
    ];

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
                          cacheWidth: headerCacheWidth,
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
          body: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => sectionBuilders[index](context),
                  childCount: sectionBuilders.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
