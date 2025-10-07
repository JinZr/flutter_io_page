import 'package:flutter/material.dart';

class PolaroidCard extends StatefulWidget {
  const PolaroidCard({super.key});

  @override
  State<PolaroidCard> createState() => _PolaroidCardState();
}

class _PolaroidCardState extends State<PolaroidCard>
    with AutomaticKeepAliveClientMixin {
  static const List<Map<String, String>> _images = [
    {"image": "assets/images/egs/egs1.webp", "title": "Dalian"},
    {"image": "assets/images/egs/egs2.webp", "title": "Dalian"},
    {"image": "assets/images/egs/egs3.webp", "title": "Dalian"},
    {"image": "assets/images/egs/egs4.webp", "title": "Dalian"},
    {"image": "assets/images/egs/egs5.webp", "title": "Hong Kong SAR"},
    {"image": "assets/images/egs/egs6.webp", "title": "Hong Kong SAR"},
    {"image": "assets/images/egs/egs7.webp", "title": "Hong Kong SAR"},
    {"image": "assets/images/egs/egs8.webp", "title": "Hong Kong SAR"},
  ];

  String? _selectedTitle;

  @override
  bool get wantKeepAlive => true;

  List<String> get _titles {
    final seen = <String>{};
    final titles = <String>[];
    for (final image in _images) {
      final title = image['title'] ?? 'Other';
      if (seen.add(title)) {
        titles.add(title);
      }
    }
    return titles;
  }

  void _onTitleSelected(String title) {
    if (title == _selectedTitle) return;
    setState(() {
      _selectedTitle = title;
    });
  }

  List<Map<String, String>> _filterImages(String? title) {
    if (title == null) return _images;
    return _images
        .where((element) => element['title'] == title)
        .toList(growable: false);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final titles = _titles;
    final selectedTitle = _effectiveSelection(titles);

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            leading: const Icon(Icons.camera),
            title: Text(
              "My Polaroid Gallery",
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
            child: RepaintBoundary(
              child: _buildDynamicArea(
                context,
                titles,
                selectedTitle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            child: Text(
              "I have one Polaroid Spectra for shooting B&W film, one SX-70 Sonar, and one SLR680 for regular shooting. My Polaroid camera collection also includes an SLR680 Special Edition (Blue Button Version), an SX-70 Model 2, a 670-AF, and a 670-AF Special Edition (also known as the Blue Button Version).",
              style: Theme.of(context).textTheme.bodyMedium!,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDynamicArea(
    BuildContext context,
    List<String> titles,
    String? selectedTitle,
  ) {
    final filteredImages = _filterImages(selectedTitle);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (titles.isNotEmpty)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final title in titles)
                  FilterChip(
                    label: Text(title),
                    selected: title == selectedTitle,
                    onSelected: (_) => _onTitleSelected(title),
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
            key: ValueKey<String?>(selectedTitle),
            child: _buildCarousel(filteredImages),
          ),
        ),
      ],
    );
  }

  Widget _buildCarousel(List<Map<String, String>> images) {
    if (images.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Text(
          'No polaroids available for this selection yet.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      );
    }

    return Container(
      width: double.maxFinite,
      height: 400,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: CarouselView.weighted(
        controller: CarouselController(initialItem: 1),
        itemSnapping: true,
        flexWeights: const <int>[1, 2, 1],
        children: images
            .map(
              (image) => Image.asset(
                image["image"]!,
                fit: BoxFit.cover,
              ),
            )
            .toList(growable: false),
      ),
    );
  }

  String? _effectiveSelection(List<String> titles) {
    if (titles.isEmpty) return null;
    final current = _selectedTitle;
    if (current != null && titles.contains(current)) {
      return current;
    }
    final fallback = titles.isNotEmpty ? titles.first : null;
    if (_selectedTitle != fallback) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        setState(() {
          _selectedTitle = fallback;
        });
      });
    }
    return fallback;
  }
}
