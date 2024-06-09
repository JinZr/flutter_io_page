import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Card.outlined(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          ListTile(
              leading: const Icon(Icons.camera),
              title: Text("My Polaroid Camera Gallery",
                  style: GoogleFonts.notoSerifDisplay(
                      textStyle:
                          const TextStyle(fontWeight: FontWeight.bold)))),
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
                  autoSlide: true,
                  children: images)),
          const ListTile(
              title: Text(
                  "I have one Polaroid Spectra for shooting B&W film, one SX-70 Sonar, and one SLR680 for regular shooting. My Polaroid camera collection also includes an SLR680 Special Edition (Blue Button Version), an SX-70 Model 2, a 670-AF, and a 670-AF Special Edition (also Blue Button Version)."))
        ]));
  }
}
