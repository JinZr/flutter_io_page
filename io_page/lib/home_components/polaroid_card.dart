import 'package:flutter/material.dart';

class PolaroidCard extends StatelessWidget {
  const PolaroidCard({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> images = [
      {"image": "assets/images/egs/egs1.jpeg", "title": "Dalian"},
      {"image": "assets/images/egs/egs2.jpeg", "title": "Dalian"},
      {"image": "assets/images/egs/egs3.jpeg", "title": "Dalian"},
      {"image": "assets/images/egs/egs4.jpeg", "title": "Dalian"},
      {"image": "assets/images/egs/egs5.jpeg", "title": "Hong Kong SAR"},
      {"image": "assets/images/egs/egs6.jpeg", "title": "Hong Kong SAR"},
      {"image": "assets/images/egs/egs7.jpeg", "title": "Hong Kong SAR"},
      {"image": "assets/images/egs/egs8.jpeg", "title": "Hong Kong SAR"},
      {"image": "assets/images/cameras/af670.jpeg", "title": "AF670"},
      {"image": "assets/images/cameras/spectra.jpeg", "title": "Spectra"},
      {"image": "assets/images/cameras/sx-70.jpeg", "title": "SX-70"},
      {"image": "assets/images/avatar/avatar.jpeg", "title": "Dalian"},
    ];
    return Card(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          ListTile(
              leading: const Icon(Icons.camera),
              title: Text("My Polaroid Gallery",
                  style: Theme.of(context).textTheme.titleMedium!)),
          const Divider(indent: 10),
          Container(
              width: double.maxFinite,
              height: 400,
              padding: const EdgeInsets.all(10),
              child: CarouselView.weighted(
                  controller: CarouselController(initialItem: 1),
                  itemSnapping: true,
                  flexWeights: const <int>[1, 2, 1],
                  children: images.map(
                    (Map<String, String> image) {
                      return Image.asset(image["image"]!, fit: BoxFit.cover);
                    },
                  ).toList())),
          const ListTile(
              title: Text(
                  "I have one Polaroid Spectra for shooting B&W film, one SX-70 Sonar, and one SLR680 for regular shooting. My Polaroid camera collection also includes an SLR680 Special Edition (Blue Button Version), an SX-70 Model 2, a 670-AF, and a 670-AF Special Edition (also Blue Button Version)."))
        ]));
  }
}
