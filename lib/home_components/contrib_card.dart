import 'package:flutter/material.dart';

import 'package:zr_jin_page/utilities/launch_url.dart';

class ContribListTile extends StatelessWidget {
  final String projectName;
  final String projectDescription;
  final String projectUrl;

  const ContribListTile({
    super.key,
    required this.projectName,
    required this.projectDescription,
    required this.projectUrl,
  });

  @override
  Widget build(BuildContext context) => ListTile(
    title: Text(projectName),
    subtitle: Text(projectDescription),
    onTap: () => launchURL(projectUrl),
  );
}

class ContribCard extends StatelessWidget {
  const ContribCard({super.key});

  @override
  Widget build(BuildContext context) => Card(
    child: Column(
      children: [
        ListTile(
          leading: const Icon(Icons.code),
          title: Text(
            "Contribution to Open Source",
            style: Theme.of(context).textTheme.titleLarge!,
          ),
        ),
        Divider(
          indent:
              Theme.of(context).listTileTheme.contentPadding
                  ?.resolve(Directionality.of(context))
                  .left ??
              16.0,
        ),
        const ContribListTile(
          projectName: "k2-fsa/icefall",
          projectUrl: "https://github.com/k2-fsa/icefall",
          projectDescription:
              "icefall contains ASR recipes for various datasets using https://github.com/k2-fsa/k2.",
        ),
        const ContribListTile(
          projectName: "lhotse-speech/lhotse",
          projectUrl: "https://github.com/lhotse-speech/lhotse",
          projectDescription:
              "Lhotse is a Python library aiming to make speech and audio data preparation flexible and accessible to a wider community. Alongside k2, it is a part of the next generation Kaldi speech processing library.",
        ),
      ],
    ),
  );
}
