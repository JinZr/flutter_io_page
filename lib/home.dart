import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'home_components/academic_service_card.dart';
import 'home_components/card_entrance_wrapper.dart';
import 'home_components/contrib_card.dart';
import 'home_components/polaroid_card.dart';
import 'home_components/selected_pub_card.dart';
import 'home_components/self_intro_card.dart';
import 'utilities/author_name.dart';
import 'dart:math' as math;

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
    // var screenWidth = MediaQuery.sizeOf(context).width;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final cardWidth = math.min(screenWidth, 1200.0);

    Widget animatedCard({required Widget child, required int index}) {
      return Center(
        child: HomeCardEntrance(
          delay: Duration(milliseconds: 120 * index),
          child: SizedBox(width: cardWidth, child: child),
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
              animatedCard(child: const SelectedPubCard(), index: 1),
              animatedCard(child: const ContribCard(), index: 2),
              animatedCard(child: const AcademicServiceCard(), index: 3),
              animatedCard(child: const PolaroidCard(), index: 4),
            ],
          ),
        ),
      ),
    );
  }
}
