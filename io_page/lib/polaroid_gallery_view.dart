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

    bool notUseDrawer =
        screenSize.height < screenSize.width + 200 && screenSize.width > 700;

    return _buildPanel(notUseDrawer);
  }

  Widget _buildPanel(bool notUseDrawer) => ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1200),
      child: ListView(
        children: [
          StaggeredGrid.count(
            crossAxisCount: notUseDrawer ? 3 : 1,
            children: const [
              Card(
                child: ListTile(
                    title: Text("This is my polaroid camera collection.")),
              ),
              PolaroidCard(
                  title: "Supercolor 670 AF",
                  imagePath:
                      "https://raw.githubusercontent.com/JinZr/flutter_io_page/main/io_page/assets/images/cameras/af670.jpeg"),
              PolaroidCard(
                  title: "Spectra",
                  imagePath:
                      "https://raw.githubusercontent.com/JinZr/flutter_io_page/main/io_page/assets/images/cameras/spectra.jpeg"),
              PolaroidCard(
                  title: "SX-70",
                  imagePath:
                      "https://raw.githubusercontent.com/JinZr/flutter_io_page/main/io_page/assets/images/cameras/sx-70.jpeg")
            ],
          )
        ],
      ));
}
