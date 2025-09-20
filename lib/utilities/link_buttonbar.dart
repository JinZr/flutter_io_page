import 'package:flutter/material.dart';

import 'package:zr_jin_page/utilities/launch_url.dart';

final linkButtonBar = Padding(
  padding: const EdgeInsets.all(8.0),
  child: OverflowBar(
    alignment: MainAxisAlignment.end,
    overflowAlignment: OverflowBarAlignment.end,
    spacing: 8,
    overflowSpacing: 8,
    children: [
      FilledButton.tonal(
        onPressed: () => launchURL(
          'https://scholar.google.com/citations?user=kgH1mk0AAAAJ&hl=en',
        ),
        child: const Text('Google Scholar'),
      ),
      TextButton(
        onPressed: () => launchURL('https://github.com/JinZr'),
        child: const Text('GitHub'),
      ),
      TextButton(
        onPressed: () =>
            launchURL('https://www.researchgate.net/profile/Zengrui-Jin'),
        child: const Text('ResearchGate'),
      ),
    ],
  ),
);
