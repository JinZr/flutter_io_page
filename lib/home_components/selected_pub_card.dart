import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zr_jin_page/theme/card_ui_tokens.dart';
import 'package:zr_jin_page/theme/layout_tokens.dart';
import 'package:zr_jin_page/utilities/content_repository.dart';
import 'package:zr_jin_page/utilities/error_view.dart';
import 'package:zr_jin_page/utilities/futures.dart';

import 'selected_pub_list_tile.dart';

class SelectedPubCard extends StatefulWidget {
  const SelectedPubCard({
    super.key,
    required this.layout,
    this.loadCachedList,
    this.repository,
  });

  final LayoutTokens layout;
  final Future<List<dynamic>> Function(String fileName)? loadCachedList;
  final ContentRepository? repository;

  @override
  State<SelectedPubCard> createState() => _SelectedPubCardState();
}

class _SelectedPubCardState extends State<SelectedPubCard>
    with AutomaticKeepAliveClientMixin {
  List<Map<String, dynamic>>? _items;
  Object? _error;
  String? _selectedTheme;
  List<String> _themes = const <String>[];
  Map<String, List<Map<String, dynamic>>> _itemsByTheme =
      const <String, List<Map<String, dynamic>>>{};
  late final ContentRepository _repository =
      widget.repository ?? ContentRepository.instance;

  @override
  void initState() {
    super.initState();
    _loadContent();
  }

  Future<void> _loadContent() async {
    final loadCachedList = widget.loadCachedList ?? loadCachedJsonList;
    try {
      final local = await loadCachedList('selected_pub_list.json');
      final mapped = _mapItems(local);
      _setItems(mapped);
    } catch (error) {
      if (mounted) {
        setState(() {
          _error = error;
        });
      }
    }

    try {
      final remote = await _repository.loadRemoteList('selected_pub_list.json');
      final mapped = _mapItems(remote);
      if (!_listEquals(mapped, _items)) {
        _setItems(mapped);
      }
    } catch (error) {
      if (mounted && _items == null) {
        setState(() {
          _error = error;
        });
      }
    } finally {
      // No-op: ensure callers awaiting the future can continue.
    }
  }

  void _setItems(List<Map<String, dynamic>> items) {
    if (!mounted) return;
    final groupedItems = _groupItemsByTheme(items);
    final themes = groupedItems.keys.toList(growable: false);
    final currentSelection = _selectedTheme;
    final nextSelection = _resolveNextTheme(currentSelection, themes);
    setState(() {
      _items = items;
      _themes = themes;
      _itemsByTheme = groupedItems;
      _selectedTheme = nextSelection;
      _error = null;
    });
  }

  void _onThemeSelected(String theme) {
    if (_selectedTheme == theme) return;
    setState(() {
      _selectedTheme = theme;
    });
  }

  String? _resolveNextTheme(String? current, List<String> themes) {
    if (themes.isEmpty) return null;
    if (current != null && themes.contains(current)) {
      return current;
    }
    return themes.first;
  }

  Map<String, List<Map<String, dynamic>>> _groupItemsByTheme(
    List<Map<String, dynamic>> items,
  ) {
    final grouped = <String, List<Map<String, dynamic>>>{};
    for (final item in items) {
      final theme = _resolveTheme(item);
      grouped.putIfAbsent(theme, () => <Map<String, dynamic>>[]).add(item);
    }
    return grouped;
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final theme = Theme.of(context);
    final cardUi = widget.layout.isCompact
        ? CardUiTokens.compact()
        : context.cardUi;
    final cardHeaderStyle = theme.textTheme.titleLarge?.copyWith(
      fontWeight: cardUi.cardHeaderFontWeight,
    );
    final contentPadding = theme.listTileTheme.contentPadding?.resolve(
      Directionality.of(context),
    );
    final headerIndent = contentPadding?.left ?? 16.0;
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            leading: const Icon(Icons.newspaper),
            title: Text("Selected Publications", style: cardHeaderStyle),
          ),
          Divider(indent: headerIndent),
          // AnimatedSize wraps the dynamic area so the card expansion animates smoothly
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            alignment: Alignment.topCenter,
            child: RepaintBoundary(child: _buildDynamicArea(context)),
          ),
        ],
      ),
    );
  }

  Widget _buildDynamicArea(BuildContext context) {
    Widget child;
    Key key;
    final layout = widget.layout;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final isCompact = layout.isCompact;
    final cardUi = isCompact ? CardUiTokens.compact() : context.cardUi;
    final tileTitleStyle =
        (isCompact ? textTheme.titleMedium : textTheme.titleMedium)?.copyWith(
          fontWeight: FontWeight.w500,
          height: isCompact ? 1.18 : 1.2,
        );
    final tileAuthorStyle =
        (isCompact ? textTheme.bodyMedium : textTheme.bodyMedium)?.copyWith(
          color: colorScheme.onSurfaceVariant,
          height: 1.2,
        );
    final metadataLabelStyle =
        (isCompact ? textTheme.labelMedium : textTheme.labelMedium)?.copyWith(
          color: colorScheme.onSecondaryContainer,
        );
    final tileSurfaceColor = colorScheme.surfaceContainerLow;
    final metadataChipColor = colorScheme.secondaryContainer.withValues(
      alpha: cardUi.metadataChipAlpha,
    );
    final metadataChipForeground = colorScheme.onSecondaryContainer;
    final metadataIconSize = isCompact
        ? cardUi.metadataIconSizeCompact
        : cardUi.metadataIconSizeRegular;

    final items = _items;
    if (items != null) {
      final themes = _themes;
      final selectedTheme =
          _selectedTheme ?? (themes.isNotEmpty ? themes.first : null);
      final filteredItems = selectedTheme == null
          ? items
          : (_itemsByTheme[selectedTheme] ?? const <Map<String, dynamic>>[]);

      child = Padding(
        padding: EdgeInsets.fromLTRB(
          layout.cardPaddingHorizontal,
          layout.cardPaddingTop,
          layout.cardPaddingHorizontal,
          layout.cardPaddingBottom,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (themes.isNotEmpty)
              _ThemeFilterSection(
                themes: themes,
                selectedTheme: selectedTheme,
                onThemeSelected: _onThemeSelected,
                layout: layout,
              ),
            if (themes.isNotEmpty) SizedBox(height: layout.cardPaddingTop),
            Text(
              _buildResultSummary(selectedTheme, filteredItems.length),
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            SizedBox(height: layout.cardPaddingTop),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                final curved = CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOut,
                );
                return FadeTransition(
                  opacity: curved,
                  child: SizeTransition(
                    sizeFactor: curved,
                    axisAlignment: -1.0,
                    child: child,
                  ),
                );
              },
              child: KeyedSubtree(
                key: ValueKey<String?>(selectedTheme),
                child: _buildListForTheme(
                  filteredItems,
                  layout: layout,
                  textTheme: textTheme,
                  titleStyle: tileTitleStyle,
                  authorStyle: tileAuthorStyle,
                  tileColor: tileSurfaceColor,
                  metadataChipColor: metadataChipColor,
                  metadataChipForeground: metadataChipForeground,
                  metadataLabelStyle: metadataLabelStyle,
                  metadataIconSize: metadataIconSize,
                ),
              ),
            ),
          ],
        ),
      );
      key = const ValueKey('content');
    } else if (_error != null) {
      child = Padding(
        padding: EdgeInsets.symmetric(
          horizontal: layout.loadingHorizontal,
          vertical: layout.loadingVertical,
        ),
        child: buildErrorView(context, _error.toString()),
      );
      key = const ValueKey('error');
    } else {
      child = Padding(
        padding: EdgeInsets.symmetric(
          horizontal: layout.loadingHorizontal,
          vertical: layout.loadingVertical,
        ),
        child: LinearProgressIndicator(),
      );
      key = const ValueKey('loading');
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeIn,
      layoutBuilder: (currentChild, previousChildren) {
        return Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[...previousChildren, ?currentChild],
        );
      },
      child: KeyedSubtree(key: key, child: child),
    );
  }

  Widget _buildListForTheme(
    List<Map<String, dynamic>> items, {
    required LayoutTokens layout,
    required TextTheme textTheme,
    required TextStyle? titleStyle,
    required TextStyle? authorStyle,
    required Color tileColor,
    required Color metadataChipColor,
    required Color metadataChipForeground,
    required TextStyle? metadataLabelStyle,
    required double metadataIconSize,
  }) {
    if (items.isEmpty) {
      return Text(
        'No publications available for this theme yet.',
        style: textTheme.bodyMedium,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var index = 0; index < items.length; index++) ...[
          if (index > 0) SizedBox(height: layout.listItemGap),
          SelectedPubListTile(
            json: items[index],
            layout: layout,
            titleStyle: titleStyle,
            authorStyle: authorStyle,
            tileColor: tileColor,
            metadataChipColor: metadataChipColor,
            metadataChipForeground: metadataChipForeground,
            metadataLabelStyle: metadataLabelStyle,
            metadataIconSize: metadataIconSize,
          ),
        ],
      ],
    );
  }

  String _buildResultSummary(String? selectedTheme, int count) {
    final noun = count == 1 ? 'publication' : 'publications';
    if (selectedTheme == null || selectedTheme.isEmpty) {
      return 'Showing $count $noun';
    }
    return 'Showing $count $noun in $selectedTheme';
  }

  static List<Map<String, dynamic>> _mapItems(List<dynamic> input) {
    return input
        .map((e) => (e as Map).cast<String, dynamic>())
        .toList(growable: false);
  }

  static bool _listEquals(
    List<Map<String, dynamic>>? a,
    List<Map<String, dynamic>>? b,
  ) {
    if (identical(a, b)) return true;
    if (a == null || b == null || a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (!mapEquals(a[i], b[i])) return false;
    }
    return true;
  }
}

class _ThemeFilterSection extends StatelessWidget {
  const _ThemeFilterSection({
    required this.themes,
    required this.selectedTheme,
    required this.onThemeSelected,
    required this.layout,
  });

  final List<String> themes;
  final String? selectedTheme;
  final ValueChanged<String> onThemeSelected;
  final LayoutTokens layout;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isCompact = layout.isCompact;
    final cardUi = isCompact ? CardUiTokens.compact() : context.cardUi;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(layout.radiusContainer),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(
            alpha: cardUi.containerOutlineAlpha,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          layout.sectionInsetHorizontal,
          layout.sectionInsetTop,
          layout.sectionInsetHorizontal,
          layout.sectionInsetBottom,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Theme',
              style: (isCompact ? textTheme.labelLarge : textTheme.labelLarge)
                  ?.copyWith(color: colorScheme.onSurfaceVariant),
            ),
            SizedBox(height: layout.listItemGap),
            Wrap(
              spacing: layout.listItemGap,
              runSpacing: layout.listItemGap,
              children: [
                for (final theme in themes)
                  ChoiceChip(
                    label: Text(theme),
                    selected: theme == selectedTheme,
                    onSelected: (_) => onThemeSelected(theme),
                    visualDensity: isCompact
                        ? VisualDensity.compact
                        : VisualDensity.standard,
                    labelPadding: EdgeInsets.symmetric(
                      horizontal: layout.chipLabelHorizontal,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

String _resolveTheme(Map<String, dynamic> json) {
  return json['theme']?.toString() ?? 'Other';
}
