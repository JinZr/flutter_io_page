import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zr_jin_page/theme/layout_tokens.dart';
import 'package:url_launcher/url_launcher.dart';

import 'intro.dart';

class IntroductionCard extends StatelessWidget {
  const IntroductionCard({super.key, required this.layout});

  final LayoutTokens layout;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final defaultTextStyle = DefaultTextStyle.of(context).style;
    final isCompact = layout.isCompact;
    final contentPadding = theme.listTileTheme.contentPadding?.resolve(
      Directionality.of(context),
    );
    final headerIndent = contentPadding?.left ?? 16.0;
    final horizontalPadding = layout.cardPaddingHorizontal;
    final topPadding = layout.cardPaddingTop;
    final bottomPadding = layout.cardPaddingBottom;
    final sectionGap = layout.sectionGap;
    final leadingIconSize = layout.media - layout.micro;
    final cardHeaderStyle = textTheme.titleLarge?.copyWith(
      fontWeight: FontWeight.w700,
    );
    final thesisTitleStyle =
        (isCompact ? textTheme.titleSmall : textTheme.titleMedium)?.copyWith(
          fontWeight: FontWeight.w600,
          height: isCompact ? 1.18 : 1.2,
        );

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: Text('Bio', style: cardHeaderStyle),
          ),
          Divider(indent: headerIndent),
          Padding(
            padding: EdgeInsets.fromLTRB(
              horizontalPadding,
              topPadding,
              horizontalPadding,
              bottomPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _SectionContainer(
                  layout: layout,
                  child: Padding(
                    padding: EdgeInsets.all(layout.cardInnerHorizontal),
                    child: const MyIntroduction(),
                  ),
                ),
                SizedBox(height: sectionGap),
                _ActionContainer(
                  layout: layout,
                  onTap: () async {
                    final uri = Uri.parse(
                      'https://www.proquest.com/openview/c516344e47cb916fa89781235f33d445/1?pq-origsite=gscholar&cbl=2026366&diss=y',
                    );
                    try {
                      await launchUrl(uri);
                    } catch (_) {
                      messenger.showSnackBar(
                        const SnackBar(content: Text('Failed to launch URL.')),
                      );
                    }
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Adversarial and Reinforcement Learning Based Data Augmentation for Dysarthric and Elderly Speech Recognition',
                        maxLines: isCompact ? 2 : 3,
                        overflow: TextOverflow.ellipsis,
                        style: thesisTitleStyle,
                      ),
                      SizedBox(height: layout.xs + layout.micro),
                      Text(
                        'Supervisor: Prof. Xunying Liu',
                        maxLines: isCompact ? 2 : 3,
                        overflow: TextOverflow.ellipsis,
                        style:
                            (isCompact
                                    ? textTheme.bodySmall
                                    : textTheme.bodyMedium)
                                ?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                  height: 1.2,
                                ),
                      ),
                      SizedBox(height: layout.cardPaddingTop),
                      _ThesisMetadataChip(layout: layout),
                    ],
                  ),
                ),
                SizedBox(height: sectionGap),
                _ActionContainer(
                  layout: layout,
                  onTap: () async {
                    try {
                      await Clipboard.setData(
                        const ClipboardData(text: 'zengrui.jin0@gmail.com'),
                      );
                      messenger.showSnackBar(
                        const SnackBar(
                          content: Text('Email address copied to clipboard.'),
                        ),
                      );
                    } catch (_) {
                      messenger.showSnackBar(
                        const SnackBar(
                          content: Text('Failed to copy email to clipboard.'),
                        ),
                      );
                    }
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.email_outlined,
                        size: leadingIconSize,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      SizedBox(width: layout.cardPaddingTop),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'zengrui.jin0 [at] gmail.com',
                              style: defaultTextStyle,
                            ),
                            SizedBox(height: layout.xs),
                            Text(
                              'Tap to copy email',
                              style: textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.content_copy_outlined,
                        size: layout.media - layout.xs,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ThesisMetadataChip extends StatelessWidget {
  const _ThesisMetadataChip({required this.layout});

  final LayoutTokens layout;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isCompact = layout.isCompact;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.secondaryContainer.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(layout.radiusPill),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: layout.chipPaddingHorizontal,
          vertical: layout.chipPaddingVertical,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.auto_stories_outlined,
              size: isCompact ? 12 : 13,
              color: colorScheme.onSecondaryContainer,
            ),
            SizedBox(width: layout.chipIconGap),
            Text(
              'Ph.D. Thesis',
              style: (isCompact ? textTheme.labelSmall : textTheme.labelMedium)
                  ?.copyWith(color: colorScheme.onSecondaryContainer),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionContainer extends StatelessWidget {
  const _SectionContainer({required this.layout, required this.child});

  final LayoutTokens layout;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(layout.radiusContainer),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.55),
        ),
      ),
      child: child,
    );
  }
}

class _ActionContainer extends StatelessWidget {
  const _ActionContainer({
    required this.layout,
    required this.child,
    required this.onTap,
  });

  final LayoutTokens layout;
  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Material(
      color: colorScheme.surfaceContainerLow,
      borderRadius: BorderRadius.circular(layout.radiusContainer),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: layout.cardInnerHorizontal,
            vertical: layout.cardInnerVertical,
          ),
          child: child,
        ),
      ),
    );
  }
}
