import 'package:flutter/material.dart';
import 'package:zr_jin_page/theme/layout_tokens.dart';
import 'package:url_launcher/url_launcher.dart';

class SelectedPubListTile extends StatelessWidget {
  final Map<String, dynamic> json;
  final LayoutTokens layout;

  const SelectedPubListTile({
    super.key,
    required this.json,
    required this.layout,
  });

  @override
  Widget build(BuildContext context) {
    final title = json['title']?.toString() ?? 'Untitled publication';
    final authors = json['author']?.toString() ?? '';
    final venue = json['venue']?.toString() ?? '';
    final year = json['year']?.toString() ?? '';
    final uri = Uri.tryParse(json['link']?.toString() ?? '');

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isCompact = layout.isCompact;
    final horizontalPadding = layout.cardInnerHorizontal;
    final verticalPadding = layout.cardInnerVertical;
    final titleMaxLines = isCompact ? 2 : 3;
    final authorMaxLines = isCompact ? 2 : 3;
    final headerGap = layout.xs + layout.micro;
    final sectionGap = layout.cardPaddingTop;
    final metadataGap = layout.md;
    final baseTitleStyle = DefaultTextStyle.of(context).style;
    final titleStyle = baseTitleStyle.copyWith(
      fontSize: (baseTitleStyle.fontSize ?? 14) + (isCompact ? 2 : 3),
      fontWeight: FontWeight.w600,
      height: isCompact ? 1.18 : 1.2,
    );
    final authorStyle = (isCompact ? textTheme.bodySmall : textTheme.bodyMedium)
        ?.copyWith(color: colorScheme.onSurfaceVariant, height: 1.2);

    return Material(
      color: colorScheme.surfaceContainerLow,
      borderRadius: BorderRadius.circular(layout.radiusContainer),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: uri == null ? null : () => launchUrl(uri),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            horizontalPadding,
            verticalPadding,
            horizontalPadding,
            verticalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: titleMaxLines,
                overflow: TextOverflow.ellipsis,
                style: titleStyle,
              ),
              if (authors.isNotEmpty) ...[
                SizedBox(height: headerGap),
                Text(
                  authors,
                  maxLines: authorMaxLines,
                  overflow: TextOverflow.ellipsis,
                  style: authorStyle,
                ),
              ],
              if (venue.isNotEmpty || year.isNotEmpty) ...[
                SizedBox(height: sectionGap),
                Wrap(
                  spacing: metadataGap,
                  runSpacing: metadataGap,
                  children: [
                    if (venue.isNotEmpty)
                      _MetadataChip(
                        icon: Icons.auto_stories_outlined,
                        label: venue,
                        layout: layout,
                      ),
                    if (year.isNotEmpty)
                      _MetadataChip(
                        icon: Icons.calendar_today_outlined,
                        label: year,
                        layout: layout,
                      ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _MetadataChip extends StatelessWidget {
  const _MetadataChip({
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
