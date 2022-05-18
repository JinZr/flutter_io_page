import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PolaroidGalleryView extends StatefulWidget {
  const PolaroidGalleryView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<PolaroidGalleryView> createState() => _PolaroidGalleryViewState();
}

class _PolaroidGalleryViewState extends State<PolaroidGalleryView> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    bool notUseDrawer =
        screenSize.height < screenSize.width - 100 && screenSize.width > 900;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: _buildPanel(notUseDrawer),
    );
  }

  Widget _buildPanel(bool notUseDrawer) {
    return StaggeredGrid.count(
      crossAxisCount: notUseDrawer ? 2 : 1,
      children: const [],
    );
  }
}
