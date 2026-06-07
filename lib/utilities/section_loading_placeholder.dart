import 'package:flutter/material.dart';

import 'package:zr_jin_page/theme/layout_tokens.dart';

class SectionLoadingPlaceholder extends StatelessWidget {
  const SectionLoadingPlaceholder({
    super.key,
    required this.layout,
    this.minHeight = 220,
  });

  final LayoutTokens layout;
  final double minHeight;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final surfaceColor = colorScheme.surfaceContainerLow;
    final blockColor = colorScheme.surfaceContainerHighest.withValues(
      alpha: 0.72,
    );
    final accentColor = colorScheme.secondaryContainer.withValues(alpha: 0.82);

    Widget block(double widthFactor, {double height = 16}) {
      return FractionallySizedBox(
        widthFactor: widthFactor,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: blockColor,
            borderRadius: BorderRadius.circular(layout.radiusPill),
          ),
          child: SizedBox(height: height),
        ),
      );
    }

    return SizedBox(
      height: minHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: surfaceColor,
              borderRadius: BorderRadius.circular(layout.radiusContainer),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                layout.cardInnerHorizontal,
                layout.cardInnerVertical,
                layout.cardInnerHorizontal,
                layout.cardInnerVertical,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  block(0.26, height: 12),
                  SizedBox(height: layout.cardPaddingTop),
                  for (var index = 0; index < 2; index++) ...[
                    if (index > 0) SizedBox(height: layout.cardPaddingTop),
                    block(0.68, height: 18),
                    SizedBox(height: layout.xs + layout.micro),
                    block(0.92, height: 12),
                    SizedBox(height: layout.xs),
                    block(0.54, height: 12),
                  ],
                ],
              ),
            ),
          ),
          const Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(layout.radiusPill),
            child: LinearProgressIndicator(
              minHeight: 4,
              valueColor: AlwaysStoppedAnimation<Color>(accentColor),
              backgroundColor: surfaceColor,
            ),
          ),
        ],
      ),
    );
  }
}
