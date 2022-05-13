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
    );
  }

  
}
