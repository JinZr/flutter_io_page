import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zr_jin_page/utilities/content_repository.dart';
import 'package:zr_jin_page/utilities/error_view.dart';
import 'package:zr_jin_page/utilities/futures.dart';

class AcademicServiceCard extends StatefulWidget {
  const AcademicServiceCard({super.key});

  @override
  State<AcademicServiceCard> createState() => _AcademicServiceCardState();
}

class _AcademicServiceCardState extends State<AcademicServiceCard>
    with AutomaticKeepAliveClientMixin {
  List<Map<String, dynamic>>? _services;
  Object? _error;
  late final ContentRepository _repository = ContentRepository.instance;
  bool _remoteRefreshScheduled = false;

  @override
  void initState() {
    super.initState();
    _loadContent();
  }

  Future<void> _loadContent() async {
    var loadedLocal = false;
    try {
      final local = await loadCachedJsonList('academic_service_list.json');
      final mapped = _map(local);
      if (mounted) {
        setState(() {
          _services = mapped;
          _error = null;
        });
      }
      loadedLocal = true;
    } catch (error) {
      if (mounted) {
        setState(() {
          _error = error;
        });
      }
    }

    if (loadedLocal) {
      _scheduleRemoteRefresh();
    } else {
      await _refreshFromRemote();
    }
  }

  void _scheduleRemoteRefresh() {
    if (_remoteRefreshScheduled) {
      return;
    }
    _remoteRefreshScheduled = true;
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      _refreshFromRemote();
    });
  }

  Future<void> _refreshFromRemote() async {
    try {
      final remote = await _repository.loadRemoteList(
        'academic_service_list.json',
      );
      final mapped = _map(remote);
      if (mounted && !_listEquals(mapped, _services)) {
        setState(() {
          _services = mapped;
          _error = null;
        });
      }
    } catch (error) {
      if (mounted && _services == null) {
        setState(() {
          _error = error;
        });
      }
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
            child: RepaintBoundary(child: _buildDynamicArea(context)),
          ),
        ],
      ),
    );
  }

  Widget _buildDynamicArea(BuildContext context) {
    Widget child;
    Key key;

    final services = _services;
    if (services != null) {
      child = ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: services.length,
        itemBuilder: (context, index) =>
            _AcademicServiceTile(json: services[index]),
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

  static List<Map<String, dynamic>> _map(List<dynamic> input) {
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

class _AcademicServiceTile extends StatelessWidget {
  const _AcademicServiceTile({required this.json});

  final Map<String, dynamic> json;

  @override
  Widget build(BuildContext context) {
    final role = json['role']?.toString() ?? 'Service';
    final organization = json['organization']?.toString();
    final location = json['location']?.toString();
    final year = json['year']?.toString();

    final subtitleParts = <String>[
      if (organization != null && organization.isNotEmpty) organization,
      if (location != null && location.isNotEmpty) location,
    ];

    final subtitleLines = <String>[
      if (subtitleParts.isNotEmpty) subtitleParts.join('  '),
    ];

    final subtitleText = subtitleLines.join('\n');

    return ListTile(
      title: Text(role),
      subtitle: subtitleText.isNotEmpty
          ? Text(subtitleText, style: Theme.of(context).textTheme.bodyMedium)
          : null,
      trailing: year != null && year.isNotEmpty
          ? Text(year, style: Theme.of(context).textTheme.labelLarge)
          : null,
      onTap: () {
        final link = json['link']?.toString();
        if (link != null && link.isNotEmpty) {
          launchUrl(Uri.parse(link));
        }
      },
    );
  }
}
