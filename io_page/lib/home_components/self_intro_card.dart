import 'package:flutter/material.dart';
import 'package:zr_jin_page/utilities/launch_url.dart';

import 'intro.dart';

class IntroductionCard extends StatelessWidget {
  const IntroductionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(children: [
      const ListTile(
          leading: Image(
              image: NetworkImage(
                  "https://raw.githubusercontent.com/JinZr/flutter_io_page/main/io_page/assets/images/avatar/avatar.jpeg")),
          title: Text("Zengrui JIN",
              style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text("金增锐")),
      const Divider(indent: 10),
      const Column(children: [
        ListTile(title: MyIntroduction()),
        ListTile(title: SelectableText("zengrui.jin [at] icloud.com")),
        ListTile(
            title: SelectableText(
                "Collecting vintage Polaroid cameras. (SLR680 & 670AF)")),
      ]),
      const Divider(indent: 10),
      ButtonBar(alignment: MainAxisAlignment.start, children: [
        TextButton(
            child: const Text("GOOGLE SCHOLAR"),
            onPressed: () => launchURL(
                'https://scholar.google.com/citations?user=kgH1mk0AAAAJ&hl=en')),
        TextButton(
            child: const Text("RESEARCHGATE"),
            onPressed: () =>
                launchURL("https://www.researchgate.net/profile/Zengrui-Jin")),
        TextButton(
          child: const Text("GITHUB"),
          onPressed: () => launchURL("https://github.com/JinZr"),
        )
      ])
    ]));
  }
}
