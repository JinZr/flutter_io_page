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
            leading: Image.asset('assets/images/avatar/avatar.jpeg'),
            title: Text("Zengrui JIN", style: Theme.of(context).textTheme.headline6!),
            subtitle: Text("金增锐", style: Theme.of(context).textTheme.subtitle2!),
          ),
          const Divider(
            indent: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ListTile(
                    leading: const Icon(Icons.people_alt_rounded),
                    title: MyIntroduction()),
                ListTile(
                  leading: const Icon(Icons.mail),
                  title: SelectableText("zengrui.jin [at] icloud.com",
                      style: Theme.of(context).textTheme.subtitle1!),
                ),
                ListTile(
                  leading: const Icon(Icons.favorite),
                  title: Text("Collecting vintage Polaroid cameras. (SLR680 & 670AF)",
                      style: Theme.of(context).textTheme.subtitle1!),
                ),
              ],
            ),
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
                child: const Text("CURRICULUM VITAE"),
                onPressed: () => {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("My CV is not available so far.")))
                    }),
          ])
        ],
      )
    );
  }

  _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
