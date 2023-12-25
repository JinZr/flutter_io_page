import 'package:flutter/material.dart';

import 'package:zr_jin_page/utilities/launch_url.dart';

class ContribListTile extends StatelessWidget {
  final String projectName;
  final String projectDescription;
  final String projectIconUrl;
  final String projectUrl;

  const ContribListTile({
    super.key,
    required this.projectName,
    required this.projectDescription,
    required this.projectUrl,
    required this.projectIconUrl,
  });

  @override
  Widget build(BuildContext context) => ListTile(
      leading: Image.network(projectIconUrl, width: 36, height: 36,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return const Center(
          child: LinearProgressIndicator(),
        );
      }),
      title: Text(projectName),
      subtitle: Text(projectDescription),
      onTap: () => launchURL(projectUrl));
}

class ContribCard extends StatelessWidget {
  const ContribCard({super.key});

  @override
  Widget build(BuildContext context) => const Card(
          child: Column(children: [
        ListTile(
            leading: Icon(Icons.code),
            title: Text("Contribution to Open Source",
                style: TextStyle(fontWeight: FontWeight.bold))),
        Divider(indent: 10),
        ContribListTile(
            projectName: "icefall",
            projectUrl: "https://github.com/k2-fsa/icefall",
            projectDescription:
                "icefall contains ASR recipes for various datasets using https://github.com/k2-fsa/k2.",
            projectIconUrl:
                "https://raw.githubusercontent.com/k2-fsa/icefall/master/docs/source/_static/logo.png"),
        ContribListTile(
            projectName: "lhotse",
            projectUrl: "https://github.com/lhotse-speech/lhotse",
            projectDescription:
                "Lhotse is a Python library aiming to make speech and audio data preparation flexible and accessible to a wider community. Alongside k2, it is a part of the next generation Kaldi speech processing library.",
            projectIconUrl:
                "https://raw.githubusercontent.com/lhotse-speech/lhotse/master/docs/logo.png"),
      ]));
}
