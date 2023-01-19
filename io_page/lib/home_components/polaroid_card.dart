import 'package:flutter/material.dart';

class PolaroidCard extends StatelessWidget {
  const PolaroidCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          ListTile(
            leading: Icon(Icons.camera,
                color: Theme.of(context).colorScheme.onSecondaryContainer),
            title: const Text("My Polaroid Camera Gallery"),
          ),
          const Divider(
            indent: 10,
          ),
          const ListTile(
            leading: Image(
                image: NetworkImage(
                    "https://raw.githubusercontent.com/JinZr/flutter_io_page/main/io_page/assets/images/cameras/af670.jpeg")),
            title: SelectableText(
                "I have one Polaroid Spectra for shooting B&W files, one SX-70 Sonar for regular shooting, one SX-70 Model 2 and one 670-AF for collection."),
          ),
        ]));
  }
}
