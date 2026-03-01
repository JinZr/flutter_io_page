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
import 'theme/card_ui_tokens.dart';
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
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final baseLayout = context.layout;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final layout = screenWidth < 700 ? LayoutTokens.compact() : baseLayout;
    final cardUi = layout.isCompact ? CardUiTokens.compact() : context.cardUi;
    final appBarTitleStyle = textTheme.titleLarge?.copyWith(
      fontWeight: cardUi.cardHeaderFontWeight,
    );
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
        appBar: AppBar(
          title: Text(AUTHOR_TEXT, style: appBarTitleStyle),
          actions: buildLinkAppBarActions(screenWidth: screenWidth),
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          surfaceTintColor: colorScheme.surfaceTint,
          shadowColor: colorScheme.shadow,
          scrolledUnderElevation: 4.0,
        ),
        body: ListView.builder(itemCount: 6, itemBuilder: buildSection),
      ),
    );
  }
}
