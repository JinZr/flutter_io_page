import 'package:flutter/material.dart';
import 'package:zr_jin_page/utilities/error_view.dart';

import 'selected_pub_list_tile.dart';
import 'package:zr_jin_page/utilities/futures.dart';

class SelectedPubCard extends StatefulWidget {
  const SelectedPubCard({super.key});

  @override
  State<SelectedPubCard> createState() => _SelectedPubCardState();
}

class _SelectedPubCardState extends State<SelectedPubCard>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
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
            child: _DynamicContent(),
          ),
        ],
      ),
    );
  }
}

class _DynamicContent extends StatelessWidget {
  const _DynamicContent();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: futureUpdate(),
      builder: (context, snapshot) {
        Widget child;
        Key key;

        if (snapshot.hasData) {
          final items = snapshot.data!;
          final limited = items.take(5).toList();
          final Map<String, List<Map<String, dynamic>>> grouped = {};
          for (final e in limited) {
            final m = (e as Map).cast<String, dynamic>();
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
        } else if (snapshot.hasError) {
          child = buildErrorView(context, snapshot.error.toString());
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
      },
    );
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
