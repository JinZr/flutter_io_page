import 'dart:convert' show json;
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

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: screenSize.height < screenSize.width - 200
            ? const EdgeInsets.fromLTRB(100, 8, 100, 8)
            : const EdgeInsets.all(8),
        child: _buildPanel(screenSize),
      ),
    );
  }

  Widget _buildPanel(Size screenSize) {
      return StaggeredGrid.count(
        crossAxisCount: screenSize.height < screenSize.width - 100 ? 2 : 1,
        children: [
         
        ],
      );
    }
}
