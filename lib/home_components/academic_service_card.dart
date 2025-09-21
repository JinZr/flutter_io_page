import 'package:flutter/material.dart';
import 'package:zr_jin_page/utilities/error_view.dart';
import 'package:zr_jin_page/utilities/futures.dart';

class AcademicServiceCard extends StatefulWidget {
  const AcademicServiceCard({super.key});

  @override
  State<AcademicServiceCard> createState() => _AcademicServiceCardState();
}

class _AcademicServiceCardState extends State<AcademicServiceCard>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            leading: const Icon(Icons.volunteer_activism),
            title: Text(
              'Academic Service',
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
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            alignment: Alignment.topCenter,
            child: const _DynamicContent(),
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
      future: futureAcademicService(),
      builder: (context, snapshot) {
        Widget child;
        Key key;

        if (snapshot.hasData) {
          final rawItems = snapshot.data!;
          final services = rawItems
              .map((e) => (e as Map).cast<String, dynamic>())
              .toList(growable: false);

          child = ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: services.length,
            itemBuilder: (context, index) =>
                _AcademicServiceTile(json: services[index]),
            separatorBuilder: (context, index) => const Divider(indent: 72),
          );
          key = const ValueKey('content');
        } else if (snapshot.hasError) {
          child = Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: buildErrorView(context, snapshot.error.toString()),
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
      },
    );
  }
}

class _AcademicServiceTile extends StatelessWidget {
  const _AcademicServiceTile({required this.json});

  final Map<String, dynamic> json;

  @override
  Widget build(BuildContext context) {
    final role = json['role']?.toString() ?? 'Service';
    final organization = json['organization']?.toString();
    final location = json['location']?.toString();
    final description = json['description']?.toString();
    final year = json['year']?.toString();

    final subtitleParts = <String>[
      if (organization != null && organization.isNotEmpty) organization,
      if (location != null && location.isNotEmpty) location,
    ];

    final subtitleLines = <String>[
      if (subtitleParts.isNotEmpty) subtitleParts.join(' • '),
      if (description != null && description.isNotEmpty) description,
    ];

    final subtitleText = subtitleLines.join('\n');

    return ListTile(
      leading: const Icon(Icons.school),
      title: Text(role),
      subtitle: subtitleText.isNotEmpty
          ? Text(
              subtitleText,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          : null,
      isThreeLine: subtitleLines.length > 1,
      trailing: year != null && year.isNotEmpty
          ? Text(
              year,
              style: Theme.of(context).textTheme.labelLarge,
            )
          : null,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }
}
