import 'package:flutter/material.dart';
import 'package:zr_jin_page/theme/card_ui_tokens.dart';
import 'package:zr_jin_page/theme/layout_tokens.dart';
import 'package:url_launcher/url_launcher.dart';

class SelectedPubListTile extends StatelessWidget {
  final Map<String, dynamic> json;
  final LayoutTokens layout;
  final TextStyle? titleStyle;
  final TextStyle? authorStyle;
  final Color? tileColor;
  final Color? metadataChipColor;
  final Color? metadataChipForeground;
  final TextStyle? metadataLabelStyle;
  final double? metadataIconSize;

  const SelectedPubListTile({
    super.key,
    required this.json,
    required this.layout,
    this.titleStyle,
    this.authorStyle,
    this.tileColor,
    this.metadataChipColor,
    this.metadataChipForeground,
    this.metadataLabelStyle,
    this.metadataIconSize,
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
    final cardUi = isCompact ? CardUiTokens.compact() : context.cardUi;
    final horizontalPadding = layout.cardInnerHorizontal;
    final verticalPadding = layout.cardInnerVertical;
    final titleMaxLines = isCompact ? 2 : 3;
    final authorMaxLines = isCompact ? 2 : 3;
    final headerGap = layout.xs + layout.micro;
    final sectionGap = layout.cardPaddingTop;
    final metadataGap = layout.md;
    final resolvedTitleStyle =
        titleStyle ??
        (isCompact ? textTheme.titleMedium : textTheme.titleMedium)?.copyWith(
          fontWeight: FontWeight.w500,
          height: isCompact ? 1.18 : 1.2,
        );
    final resolvedAuthorStyle =
        authorStyle ??
        (isCompact ? textTheme.bodyMedium : textTheme.bodyMedium)?.copyWith(
          color: colorScheme.onSurfaceVariant,
          height: 1.2,
        );
    final resolvedTileColor = tileColor ?? colorScheme.surfaceContainerLow;
    final resolvedMetadataChipColor =
        metadataChipColor ??
        colorScheme.secondaryContainer.withValues(
          alpha: cardUi.metadataChipAlpha,
        );
    final resolvedMetadataChipForeground =
        metadataChipForeground ?? colorScheme.onSecondaryContainer;
    final resolvedMetadataLabelStyle =
        metadataLabelStyle ??
        (isCompact ? textTheme.labelMedium : textTheme.labelMedium)?.copyWith(
          color: resolvedMetadataChipForeground,
        );
    final resolvedMetadataIconSize =
        metadataIconSize ??
        (isCompact
            ? cardUi.metadataIconSizeCompact
            : cardUi.metadataIconSizeRegular);

    return Material(
      color: resolvedTileColor,
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
                style: resolvedTitleStyle,
              ),
              if (authors.isNotEmpty) ...[
                SizedBox(height: headerGap),
                Text(
                  authors,
                  maxLines: authorMaxLines,
                  overflow: TextOverflow.ellipsis,
                  style: resolvedAuthorStyle,
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
                        backgroundColor: resolvedMetadataChipColor,
                        foregroundColor: resolvedMetadataChipForeground,
                        labelStyle: resolvedMetadataLabelStyle,
                        iconSize: resolvedMetadataIconSize,
                      ),
                    if (year.isNotEmpty)
                      _MetadataChip(
                        icon: Icons.calendar_today_outlined,
                        label: year,
                        layout: layout,
                        backgroundColor: resolvedMetadataChipColor,
                        foregroundColor: resolvedMetadataChipForeground,
                        labelStyle: resolvedMetadataLabelStyle,
                        iconSize: resolvedMetadataIconSize,
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
    required this.backgroundColor,
    required this.foregroundColor,
    required this.labelStyle,
    required this.iconSize,
  });

  final IconData icon;
  final String label;
  final LayoutTokens layout;
  final Color backgroundColor;
  final Color foregroundColor;
  final TextStyle? labelStyle;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
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
            Icon(icon, size: iconSize, color: foregroundColor),
            SizedBox(width: layout.chipIconGap),
            Text(label, style: labelStyle),
          ],
        ),
      ),
    );
  }
}
