import 'package:flutter/material.dart';

import 'package:zr_jin_page/theme/layout_tokens.dart';
import 'package:zr_jin_page/utilities/launch_url.dart';

class ContribCard extends StatelessWidget {
  const ContribCard({super.key, required this.layout});

  final LayoutTokens layout;

  static const List<_ContribProject> _projects = [
    _ContribProject(
      name: 'k2-fsa/icefall',
      url: 'https://github.com/k2-fsa/icefall',
      description:
          'icefall contains ASR recipes for various datasets using https://github.com/k2-fsa/k2.',
    ),
    _ContribProject(
      name: 'lhotse-speech/lhotse',
      url: 'https://github.com/lhotse-speech/lhotse',
      description:
          'Lhotse is a Python library aiming to make speech and audio data preparation flexible and accessible to a wider community. Alongside k2, it is a part of the next generation Kaldi speech processing library.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final contentPadding = theme.listTileTheme.contentPadding?.resolve(
      Directionality.of(context),
    );
    final headerIndent = contentPadding?.left ?? 16.0;
    final horizontalPadding = layout.cardPaddingHorizontal;
    final topPadding = layout.cardPaddingTop;
    final bottomPadding = layout.cardPaddingBottom;
    final itemGap = layout.cardPaddingTop;
    final cardHeaderStyle = textTheme.titleLarge?.copyWith(
      fontWeight: FontWeight.w700,
    );

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            leading: const Icon(Icons.code),
            title: Text('Contribution to Open Source', style: cardHeaderStyle),
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
                Text(
                  'Selected repositories',
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                SizedBox(height: layout.cardPaddingTop),
                for (var index = 0; index < _projects.length; index++) ...[
                  if (index > 0) SizedBox(height: itemGap),
                  _ContribTile(project: _projects[index], layout: layout),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContribTile extends StatelessWidget {
  const _ContribTile({required this.project, required this.layout});

  final _ContribProject project;
  final LayoutTokens layout;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isCompact = layout.isCompact;
    final titleStyle =
        (isCompact ? textTheme.titleSmall : textTheme.titleMedium)?.copyWith(
          fontWeight: FontWeight.w500,
          height: isCompact ? 1.18 : 1.2,
        );
    final descriptionStyle =
        (isCompact ? textTheme.bodySmall : textTheme.bodyMedium)?.copyWith(
          color: colorScheme.onSurfaceVariant,
          height: 1.2,
        );

    return Material(
      color: colorScheme.surfaceContainerLow,
      borderRadius: BorderRadius.circular(layout.radiusContainer),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => launchURL(project.url),
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
              Text(
                project.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: titleStyle,
              ),
              SizedBox(height: layout.xs + layout.micro),
              Text(project.description, style: descriptionStyle),
              SizedBox(height: layout.cardPaddingTop),
              Wrap(
                spacing: layout.md,
                runSpacing: layout.md,
                children: [
                  _ContribMetadataChip(
                    icon: Icons.code_outlined,
                    label: 'GitHub Repository',
                    layout: layout,
                  ),
                  _ContribMetadataChip(
                    icon: Icons.open_in_new,
                    label: 'Open Project',
                    layout: layout,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContribMetadataChip extends StatelessWidget {
  const _ContribMetadataChip({
    required this.icon,
    required this.label,
    required this.layout,
  });

  final IconData icon;
  final String label;
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
              icon,
              size: isCompact ? 12 : 13,
              color: colorScheme.onSecondaryContainer,
            ),
            SizedBox(width: layout.chipIconGap),
            Text(
              label,
              style: (isCompact ? textTheme.labelSmall : textTheme.labelMedium)
                  ?.copyWith(color: colorScheme.onSecondaryContainer),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContribProject {
  const _ContribProject({
    required this.name,
    required this.description,
    required this.url,
  });

  final String name;
  final String description;
  final String url;
}
