import 'package:flutter/material.dart';

import 'package:zr_jin_page/utilities/launch_url.dart';

final linkButtonBar = ButtonBar(children: [
  TextButton(
      child: const Text("Google Scholar"),
      onPressed: () => launchURL(
          'https://scholar.google.com/citations?user=kgH1mk0AAAAJ&hl=en')),
  TextButton(
      child: const Text("ResearchGate"),
      onPressed: () =>
          launchURL("https://www.researchgate.net/profile/Zengrui-Jin")),
  TextButton(
      child: const Text("GitHub"),
      onPressed: () => launchURL("https://github.com/JinZr"))
]);
