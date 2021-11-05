import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'intro.dart';

class Introduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        ListTile(
          leading: const Image(image: AssetImage('images/avatar.jpeg')),
          title: const Text("Zengrui JIN"),
          subtitle: MyIntroduction(),
        ),
        ButtonBar(alignment: MainAxisAlignment.start, children: [
          TextButton(
              child: const Text("GOOGLE SCHOLAR"),
              onPressed: () => _launchURL(
                  'https://scholar.google.com/citations?user=kgH1mk0AAAAJ&hl=en')),
          TextButton(child: const Text("CV"), onPressed: null),
        ])
      ],
    ));
  }
}

_launchURL(String url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
