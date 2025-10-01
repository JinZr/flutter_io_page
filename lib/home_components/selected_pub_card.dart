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
      if (mounted) {
        setState(() {
          _items = mapped;
          _error = null;
        });
      }
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
      if (mounted && !_listEquals(mapped, _items)) {
        setState(() {
          _items = mapped;
          _error = null;
        });
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
      final limited = items.take(5).toList(growable: false);
      final Map<String, List<Map<String, dynamic>>> grouped = {};
      for (final m in limited) {
        final theme = _resolveTheme(m);
        grouped.putIfAbsent(theme, () => <Map<String, dynamic>>[]).add(m);
      }

      final children = <Widget>[];
      grouped.forEach((theme, groupItems) {
        children.add(_SubHeader(theme));
        for (final m in groupItems) {
          children.add(SelectedPubListTile(json: m));
        }
      });

      child = ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: children,
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

class _SubHeader extends StatelessWidget {
  final String label;
  const _SubHeader(this.label);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.surfaceContainerHighest;
    final style = Theme.of(
      context,
    ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: color,
      child: Text(label, style: style),
    );
  }
}

String _resolveTheme(Map<String, dynamic> json) {
  return json['theme']?.toString() ?? 'Other';
}
