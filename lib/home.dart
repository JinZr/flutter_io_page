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
import 'theme/layout_tokens.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.titleEn, required this.titleZh});

  final String titleEn;
  final String titleZh;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _toolbarFloating = false;
  late final DisposableBuildContext<State> _imageLoadContext;

  @override
  void initState() {
    super.initState();
    _imageLoadContext = DisposableBuildContext<State>(this);
  }

  @override
  void dispose() {
    _imageLoadContext.dispose();
    super.dispose();
  }

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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final baseLayout = context.layout;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
    final layout = screenWidth < 700 ? LayoutTokens.compact() : baseLayout;
    final cardWidth = math.min(screenWidth, 1200.0);
    final headerCacheWidth = (cardWidth * devicePixelRatio).round();
    final headerCacheHeight = (320.0 * devicePixelRatio).round();
    final headerImageProvider = ScrollAwareImageProvider<Object>(
      context: _imageLoadContext,
      imageProvider: ResizeImage.resizeIfNeeded(
        headerCacheWidth,
        headerCacheHeight,
        const AssetImage('assets/images/header.webp'),
      ),
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

    Widget buildSection(BuildContext context, int index) {
      switch (index) {
        case 0:
          return animatedCard(
            child: IntroductionCard(layout: layout),
            index: index,
          );
        case 1:
          return animatedCard(
            child: DeferredWidget(
              libraryLoader: selected_pub.loadLibrary,
              placeholder: const CardPlaceholder(minHeight: 220),
              builder: (_) => selected_pub.SelectedPubCard(layout: layout),
            ),
            index: index,
          );
        case 2:
          return animatedCard(
            child: DeferredWidget(
              libraryLoader: contrib.loadLibrary,
              placeholder: const CardPlaceholder(minHeight: 220),
              builder: (_) => contrib.ContribCard(layout: layout),
            ),
            index: index,
          );
        case 3:
          return animatedCard(
            child: DeferredWidget(
              libraryLoader: academic_service.loadLibrary,
              placeholder: const CardPlaceholder(minHeight: 220),
              builder: (_) =>
                  academic_service.AcademicServiceCard(layout: layout),
            ),
            index: index,
          );
        case 4:
          return animatedCard(
            child: DeferredWidget(
              libraryLoader: polaroid.loadLibrary,
              placeholder: const CardPlaceholder(minHeight: 320),
              builder: (_) => polaroid.PolaroidCard(layout: layout),
            ),
            index: index,
          );
        default:
          return Padding(
            padding: EdgeInsets.symmetric(vertical: layout.footer),
            child: Center(
              child: Text(
                'This site is proudly powered by Flutter and composed by Zengrui Jin.',
                style: textTheme.bodySmall,
              ),
            ),
          );
      }
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
                    backgroundColor: colorScheme.surface,
                    foregroundColor: colorScheme.onSurface,
                    surfaceTintColor: colorScheme.surfaceTint,
                    shadowColor: colorScheme.shadow,
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
                      titlePadding: EdgeInsetsDirectional.only(
                        start: layout.xxxl,
                        bottom: layout.xxxl,
                      ),
                      title: Text(AUTHOR_TEXT, style: textTheme.headlineSmall),
                      background: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image(
                            image: headerImageProvider,
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.medium,
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  colorScheme.surfaceTint.withValues(
                                    alpha: 0.35,
                                  ),
                                  colorScheme.surface.withValues(alpha: 0.85),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
            body: ListView.builder(itemCount: 6, itemBuilder: buildSection),
          ),
        ),
      ),
    );
  }
}
