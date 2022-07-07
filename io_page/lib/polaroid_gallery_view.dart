import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'polaroid_gallery_view_components/polaroid_card.dart';

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

    bool extended =
        screenSize.height < screenSize.width - 500 && screenSize.width > 900;
    bool notUseDrawer =
        screenSize.height < screenSize.width + 200 && screenSize.width > 700;
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return _buildPanel(notUseDrawer);
  }

  Widget _buildPanel(bool notUseDrawer) {
    return ListView(
      children: [
        StaggeredGrid.count(
          crossAxisCount: notUseDrawer ? 3 : 1,
          children: const [
            Card(
              child: ListTile(title: Text("This is my polaroid camera collection.")),
            ),
            PolaroidCard(
                title: "Supercolor 670 AF", imagePath: "assets/images/cameras/af670.jpeg"),
            PolaroidCard(
                title: "Spectra",
                imagePath: "assets/images/cameras/spectra.jpeg"),
            PolaroidCard(
                title: "SX-70", imagePath: "assets/images/cameras/sx-70.jpeg")
          ],
        )
      ],
    );
  }
}
