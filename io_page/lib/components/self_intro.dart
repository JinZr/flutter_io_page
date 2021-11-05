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
          subtitle: Text("金增锐",
              style: TextStyle(color: Colors.black.withOpacity(0.6))),
        ),
        ListTile(
            leading: const Icon(Icons.people_alt_rounded),
            title: MyIntroduction()),
        ListTile(
          leading: const Icon(Icons.mail),
          title: Text("zengrui.jin [at] outlook.com",
              style: TextStyle(color: Colors.black.withOpacity(0.6))),
        ),
        ListTile(
          leading: const Icon(Icons.favorite),
          title: Text("Collecting Polaroid cameras! 📷 📸️",
              style: TextStyle(color: Colors.black.withOpacity(0.6))),
        ),
        ButtonBar(alignment: MainAxisAlignment.start, children: [
          TextButton(
              child: const Text("GOOGLE SCHOLAR"),
              onPressed: () => _launchURL(
                  'https://scholar.google.com/citations?user=kgH1mk0AAAAJ&hl=en')),
          TextButton(
              child: const Text("RESEARCH GATE"),
              onPressed: () => _launchURL(
                  "https://www.researchgate.net/profile/Zengrui-Jin")),
          TextButton(
              child: const Text("CV"),
              onPressed: () => {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("My CV is not available so far.")))
                  }),
        ])
      ],
    ));
  }

  _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
