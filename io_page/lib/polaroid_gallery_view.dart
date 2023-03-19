import 'package:flutter/material.dart';

// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'polaroid_gallery_view_components/polaroid_card.dart';

class PolaroidGalleryView extends StatelessWidget {
  const PolaroidGalleryView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1200),
      child: ListView(
        children: const [
          PolaroidCard(
            title: "Supercolor 670 AF",
            imagePath:
                "https://raw.githubusercontent.com/JinZr/flutter_io_page/main/io_page/assets/images/cameras/af670.jpeg",
          ),
          PolaroidCard(
            title: "Spectra",
            imagePath:
                "https://raw.githubusercontent.com/JinZr/flutter_io_page/main/io_page/assets/images/cameras/spectra.jpeg",
          ),
          PolaroidCard(
            title: "SX-70",
            imagePath:
                "https://raw.githubusercontent.com/JinZr/flutter_io_page/main/io_page/assets/images/cameras/sx-70.jpeg",
          ),
        ],
      ),
    );
  }
}
