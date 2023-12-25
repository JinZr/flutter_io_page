import 'package:flutter/material.dart';
import 'package:zr_jin_page/utilities/author_name.dart';
import 'package:zr_jin_page/utilities/link_buttonbar.dart';

import 'intro.dart';

class IntroductionCard extends StatelessWidget {
  const IntroductionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(children: [
      const ListTile(
          leading: Image(
              image: NetworkImage(
                  "https://raw.githubusercontent.com/JinZr/flutter_io_page/main/io_page/assets/images/avatar/avatar.jpeg")),
          title:
              Text(AUTHOR_TEXT, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text("金增锐")),
      const Divider(indent: 10),
      const Column(children: [
        ListTile(title: MyIntroduction()),
        ListTile(title: SelectableText("zengrui.jin0 [at] gmail.com")),
      ]),
      linkButtonBar
    ]));
  }
}
