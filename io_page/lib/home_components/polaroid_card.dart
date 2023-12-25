import 'package:flutter/material.dart';

class PolaroidCard extends StatelessWidget {
  const PolaroidCard({super.key});

  @override
  Widget build(BuildContext context) {
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
          SizedBox(
              height: 300,
              child:
                  ListView(scrollDirection: Axis.horizontal, children: const [
                Image(
                    image: NetworkImage(
                        "https://raw.githubusercontent.com/JinZr/flutter_io_page/main/io_page/assets/images/cameras/af670.jpeg")),
                Image(
                    image: NetworkImage(
                        "https://raw.githubusercontent.com/JinZr/flutter_io_page/main/io_page/assets/images/cameras/spectra.jpeg")),
                Image(
                    image: NetworkImage(
                        "https://raw.githubusercontent.com/JinZr/flutter_io_page/main/io_page/assets/images/cameras/sx-70.jpeg")),
              ])),
          const ListTile(
              title: Text(
                  "I have one Polaroid Spectra for shooting B&W files, one SX-70 Sonar for regular shooting, one SX-70 Model 2 and one 670-AF for collection."))
        ]));
  }
}
