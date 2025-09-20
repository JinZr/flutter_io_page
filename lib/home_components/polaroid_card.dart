import 'package:flutter/material.dart';

class PolaroidCard extends StatelessWidget {
  const PolaroidCard({super.key});

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

  @override
  Widget build(BuildContext context) {
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
          const Divider(indent: 10),
          Container(
            width: double.maxFinite,
            height: 400,
            padding: const EdgeInsets.all(10),
            child: CarouselView.weighted(
              controller: CarouselController(initialItem: 1),
              itemSnapping: true,
              flexWeights: const <int>[1, 2, 1],
              children: _images
                  .map(
                    (Map<String, String> image) =>
                        Image.asset(image["image"]!, fit: BoxFit.cover),
                  )
                  .toList(),
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
}
