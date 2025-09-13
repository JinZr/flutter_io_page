import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:zr_jin_page/utilities/author_name.dart';
import 'package:zr_jin_page/utilities/link_buttonbar.dart';

import 'intro.dart';

class IntroductionCard extends StatelessWidget {
  const IntroductionCard({super.key});

  @override
  Widget build(BuildContext context) => Card(
    child: Column(
      children: [
        ListTile(
          leading: const Icon(Icons.person),
          title: Text(
            AUTHOR_TEXT,
            style: Theme.of(context).textTheme.titleMedium!,
          ),
          subtitle: const Text("金增锐"),
        ),
        ListTile(title: const MyIntroduction()),
        ListTile(
          leading: const Icon(Icons.email),
          title: Text(
            "zengrui.jin0 [at] gmail.com",
            style: Theme.of(context).textTheme.bodyMedium!,
          ),
          onTap: () {
            Clipboard.setData(
                  const ClipboardData(text: "zengrui.jin0@gmail.com"),
                )
                .catchError((e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Failed to write the address to clipboard.",
                      ),
                    ),
                  );
                })
                .then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Email address copied to clipboard."),
                    ),
                  );
                });
          },
        ),
        linkButtonBar,
      ],
    ),
  );
}
