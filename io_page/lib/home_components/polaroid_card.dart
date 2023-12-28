import 'package:flutter/material.dart';

import 'package:m3_carousel/m3_carousel.dart';

class PolaroidCard extends StatelessWidget {
  const PolaroidCard({super.key});

  @override
  Widget build(BuildContext context) {
    final images = [
      {"image": "assets/images/cameras/af670.jpeg", "title": "AF670"},
      {"image": "assets/images/cameras/spectra.jpeg", "title": "Spectra"},
      {"image": "assets/images/cameras/sx-70.jpeg", "title": "SX-70"},
    ];
    return Card(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          const ListTile(
              leading: Icon(Icons.camera),
              title: Text("My Polaroid Camera Gallery",
                  style: TextStyle(fontWeight: FontWeight.bold))),
          const Divider(indent: 10),
          Container(
            width: double.maxFinite,
            height: 400,
            padding: const EdgeInsets.all(10),
            child: M3Carousel(
              visible: images.length,
              borderRadius: 20,
              slideAnimationDuration: 300,
              titleFadeAnimationDuration: 300,
              children: images,
            ),
          ),
          const ListTile(
              title: Text(
                  "I have one Polaroid Spectra for shooting B&W files, one SX-70 Sonar for regular shooting, one SX-70 Model 2 and one 670-AF for collection."))
        ]));
  }
}
