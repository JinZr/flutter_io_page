import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zr_jin_page/utilities/content_repository.dart';
import 'package:zr_jin_page/utilities/error_view.dart';
import 'package:zr_jin_page/utilities/futures.dart';

import 'selected_pub_list_tile.dart';

class SelectedPubCard extends StatefulWidget {
  const SelectedPubCard({super.key});

  @override
  State<SelectedPubCard> createState() => _SelectedPubCardState();
}

class _SelectedPubCardState extends State<SelectedPubCard>
    with AutomaticKeepAliveClientMixin {
  List<Map<String, dynamic>>? _items;
  Object? _error;
  String? _selectedTheme;
  late final ContentRepository _repository = ContentRepository.instance;

  @override
  void initState() {
    super.initState();
    _loadContent();
  }

  Future<void> _loadContent() async {
    try {
      final local = await loadCachedJsonList('selected_pub_list.json');
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
    final themes = _extractThemes(items);
    final currentSelection = _selectedTheme;
    final nextSelection = _resolveNextTheme(currentSelection, themes);
    setState(() {
      _items = items;
      _selectedTheme = nextSelection;
      _error = null;
    });
  }

  void _onThemeChipTapped(String theme) {
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

  List<String> _extractThemes(List<Map<String, dynamic>> items) {
    final seen = <String>{};
    final result = <String>[];
    for (final item in items) {
      final theme = _resolveTheme(item);
      if (seen.add(theme)) {
        result.add(theme);
      }
    }
    return result;
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            leading: const Icon(Icons.newspaper),
            title: Text(
              "Selected Publications",
              style: Theme.of(context).textTheme.titleMedium!,
            ),
          ),
          Divider(
            indent:
                Theme.of(context).listTileTheme.contentPadding
                    ?.resolve(Directionality.of(context))
                    .left ??
                16.0,
          ),
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

    final items = _items;
    if (items != null) {
      final themes = _extractThemes(items);
      final selectedTheme =
          _selectedTheme ?? (themes.isNotEmpty ? themes.first : null);
      final filteredItems = selectedTheme == null
          ? items
          : items
                .where((m) => _resolveTheme(m) == selectedTheme)
                .toList(growable: false);

      child = Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (themes.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final theme in themes)
                    FilterChip(
                      label: Text(theme),
                      selected: theme == selectedTheme,
                      onSelected: (_) => _onThemeChipTapped(theme),
                    ),
                ],
              ),
            ),
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
              child: _buildListForTheme(filteredItems),
            ),
          ),
        ],
      );
      key = const ValueKey('content');
    } else if (_error != null) {
      child = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: buildErrorView(context, _error.toString()),
      );
      key = const ValueKey('error');
    } else {
      child = const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
          children: <Widget>[
            ...previousChildren,
            if (currentChild != null) currentChild,
          ],
        );
      },
      child: KeyedSubtree(key: key, child: child),
    );
  }

  Widget _buildListForTheme(List<Map<String, dynamic>> items) {
    if (items.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          'No publications available for this theme yet.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      );
    }

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return SelectedPubListTile(json: items[index]);
      },
    );
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

String _resolveTheme(Map<String, dynamic> json) {
  return json['theme']?.toString() ?? 'Other';
}
