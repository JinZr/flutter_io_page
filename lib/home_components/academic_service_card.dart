import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zr_jin_page/theme/layout_tokens.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zr_jin_page/utilities/content_repository.dart';
import 'package:zr_jin_page/utilities/error_view.dart';
import 'package:zr_jin_page/utilities/futures.dart';

class AcademicServiceCard extends StatefulWidget {
  const AcademicServiceCard({
    super.key,
    required this.layout,
    this.loadCachedList,
    this.repository,
  });

  final LayoutTokens layout;
  final Future<List<dynamic>> Function(String fileName)? loadCachedList;
  final ContentRepository? repository;

  @override
  State<AcademicServiceCard> createState() => _AcademicServiceCardState();
}

class _AcademicServiceCardState extends State<AcademicServiceCard>
    with AutomaticKeepAliveClientMixin {
  List<Map<String, dynamic>>? _services;
  Object? _error;
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
      final local = await loadCachedList('academic_service_list.json');
      final mapped = _map(local);
      if (mounted) {
        setState(() {
          _services = mapped;
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
    final theme = Theme.of(context);
    final cardHeaderStyle = theme.textTheme.titleLarge?.copyWith(
      fontWeight: FontWeight.w700,
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
            leading: const Icon(Icons.volunteer_activism),
            title: Text('Academic Service', style: cardHeaderStyle),
          ),
          Divider(indent: headerIndent),
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

    final services = _services;
    if (services != null) {
      child = Padding(
        padding: EdgeInsets.fromLTRB(
          layout.cardPaddingHorizontal,
          layout.cardPaddingTop,
          layout.cardPaddingHorizontal,
          layout.cardPaddingBottom,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Service roles',
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            SizedBox(height: layout.cardPaddingTop),
            for (var index = 0; index < services.length; index++) ...[
              if (index > 0) SizedBox(height: layout.cardPaddingTop),
              _AcademicServiceTile(json: services[index], layout: layout),
            ],
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
  const _AcademicServiceTile({required this.json, required this.layout});

  final Map<String, dynamic> json;
  final LayoutTokens layout;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isCompact = layout.isCompact;
    final role = json['role']?.toString() ?? 'Service';
    final organization = json['organization']?.toString();
    final location = json['location']?.toString();
    final year = json['year']?.toString();
    final uri = Uri.tryParse(json['link']?.toString() ?? '');
    final roleStyle = (isCompact ? textTheme.titleSmall : textTheme.titleMedium)
        ?.copyWith(fontWeight: FontWeight.w500, height: isCompact ? 1.18 : 1.2);
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
        onTap: uri == null ? null : () => launchUrl(uri),
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
                role,
                maxLines: isCompact ? 2 : 3,
                overflow: TextOverflow.ellipsis,
                style: roleStyle,
              ),
              if (organization != null && organization.isNotEmpty) ...[
                SizedBox(height: layout.xs + layout.micro),
                Text(
                  organization,
                  maxLines: isCompact ? 2 : 3,
                  overflow: TextOverflow.ellipsis,
                  style: descriptionStyle,
                ),
              ],
              if ((location != null && location.isNotEmpty) ||
                  (year != null && year.isNotEmpty)) ...[
                SizedBox(height: layout.cardPaddingTop),
                Wrap(
                  spacing: layout.md,
                  runSpacing: layout.md,
                  children: [
                    if (location != null && location.isNotEmpty)
                      _ServiceMetadataChip(
                        icon: Icons.place_outlined,
                        label: location,
                        layout: layout,
                      ),
                    if (year != null && year.isNotEmpty)
                      _ServiceMetadataChip(
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

class _ServiceMetadataChip extends StatelessWidget {
  const _ServiceMetadataChip({
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
