import 'package:flutter/material.dart';

class PolaroidGalleryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          const ListTile(
            leading: Icon(Icons.camera),
            title: Text("My Polaroid Camera Gallery"),
          ),
          const Divider(
            indent: 10,
          ),
          Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "I have one Polaroid Spectra for shooting B&W files, one SX-70 Sonar for regular shooting, one SX-70 Model 2 and one 670-AF for collection.",
                    style: Theme.of(context).textTheme.bodyText1!,
                  )),
              Image.asset("assets/images/cameras/af670.jpeg"),
              Image.asset("assets/images/cameras/sx70.jpeg"),
              Image.asset("assets/images/cameras/spectra.jpeg"),
            ],
          )
        ]));
  }
}
