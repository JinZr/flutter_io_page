import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:zr_jin_page/utilities/author_name.dart';
import 'package:zr_jin_page/utilities/link_buttonbar.dart';

import 'intro.dart';

class IntroductionCard extends StatelessWidget {
  const IntroductionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(children: [
      ListTile(
          leading: Image.network(
              "https://raw.githubusercontent.com/JinZr/flutter_io_page/main/io_page/assets/images/avatar/avatar.jpeg"),
          title: const Text(AUTHOR_TEXT,
              style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: const Text("金增锐")),
      const Divider(indent: 10),
      Column(children: [
        const ListTile(title: MyIntroduction()),
        ListTile(
            title: const Text("zengrui.jin0 [at] gmail.com"),
            onTap: () {
              Clipboard.setData(
                      const ClipboardData(text: "zengrui.jin0@gmail.com"))
                  .catchError((e) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content:
                        Text("Failed to write the address to clipboard.")));
              }).then((value) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Email address copied to clipboard.")));
              });
            })
      ]),
      const Divider(indent: 10),
      linkButtonBar
    ]));
  }
}
