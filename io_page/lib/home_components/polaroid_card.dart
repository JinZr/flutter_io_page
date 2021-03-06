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
            leading: Icon(Icons.camera, color: Theme.of(context).colorScheme.onSecondaryContainer),
            title: const Text("My Polaroid Camera Gallery"),
          ),
          const Divider(
            indent: 10,
          ),
          Stack(children: <Widget>[
            Container(
              height: 350,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/cameras/af670.jpeg')),
              ),
            ),
            Container(
              height: 350,
              decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.grey.withOpacity(0.0),
                        Colors.black,
                      ],
                      stops: const [
                        0.0,
                        1.0
                      ])),
            ),
          ]),
          Padding(
              padding: const EdgeInsets.all(16),
              child: SelectableText(
                "I have one Polaroid Spectra for shooting B&W files, one SX-70 Sonar for regular shooting, one SX-70 Model 2 and one 670-AF for collection.",
                style: Theme.of(context).textTheme.bodyMedium,
                enableInteractiveSelection: true,
              )),
        ]));
  }
}
