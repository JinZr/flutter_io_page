import 'package:flutter/material.dart';
import 'package:zr_jin_page/utilities/error_view.dart';

import 'selected_pub_list_tile.dart';
import 'package:zr_jin_page/utilities/futures.dart';

class SelectedPubCard extends StatelessWidget {
  const SelectedPubCard({super.key});

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
          const Divider(indent: 10),
          FutureBuilder<List<dynamic>>(
            future: futureUpdate(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final items = snapshot.data!;
                final limited = items.take(5).toList();
                final Map<String, List<Map<String, dynamic>>> grouped = {};
                for (final e in limited) {
                  final m = (e as Map).cast<String, dynamic>();
                  final theme = _resolveTheme(m);
                  grouped
                      .putIfAbsent(theme, () => <Map<String, dynamic>>[])
                      .add(m);
                }

                final children = <Widget>[];
                grouped.forEach((theme, groupItems) {
                  children.add(_SubHeader(theme));
                  for (final m in groupItems) {
                    children.add(SelectedPubListTile(json: m));
                  }
                });

                return ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: children,
                );
              } else if (snapshot.hasError) {
                return buildErrorView(context, snapshot.error.toString());
              } else {
                return const Center(child: LinearProgressIndicator());
              }
            },
          ),
        ],
      ),
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
