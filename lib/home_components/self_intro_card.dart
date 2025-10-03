import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:zr_jin_page/utilities/author_name.dart';
import 'package:zr_jin_page/utilities/link_buttonbar.dart';

import 'intro.dart';

class IntroductionCard extends StatelessWidget {
  const IntroductionCard({super.key});

  @override
  Widget build(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);
    return Card(
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: MyIntroduction(),
          ),
          ListTile(
            title: Text(
              "Adversarial and Reinforcement Learning Based Data Augmentation for Dysarthric and Elderly Speech Recognition",
              style: Theme.of(context).textTheme.bodyMedium!,
            ),
            subtitle: const Text("Supervisor: Prof. Xunying Liu"),
            trailing: const Text("Ph.D. Thesis"),
            onTap: () async {
              final uri = Uri.parse(
                "https://www.proquest.com/docview/3252771546?accountid=29018&sourcetype=Dissertations%20&%20Theses",
              );
              try {
                await launchUrl(uri);
              } catch (_) {
                messenger.showSnackBar(
                  const SnackBar(content: Text("Failed to launch URL.")),
                );
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: Text(
              "zengrui.jin0 [at] gmail.com",
              style: Theme.of(context).textTheme.bodyMedium!,
            ),
            onTap: () async {
              try {
                await Clipboard.setData(
                  const ClipboardData(text: "zengrui.jin0@gmail.com"),
                );
                messenger.showSnackBar(
                  const SnackBar(
                    content: Text('Email address copied to clipboard.'),
                  ),
                );
              } catch (_) {
                messenger.showSnackBar(
                  const SnackBar(
                    content: Text("Failed to copy email to clipboard."),
                  ),
                );
              }
            },
          ),
          linkButtonBar,
        ],
      ),
    );
  }
}
