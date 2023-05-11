import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'intro.dart';

class IntroductionCard extends StatelessWidget {
  const IntroductionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        // Stack(children: <Widget>[
        //   Container(
        //     height: 200,
        //     decoration: const BoxDecoration(
        //       color: Colors.transparent,
        //       image: DecorationImage(
        //           fit: BoxFit.cover,
        //           image: AssetImage('assets/images/avatar/avatar.jpeg')),
        //     ),
        //   ),
        //   Container(
        //     height: 200,
        //     decoration: BoxDecoration(
        //         color: Colors.white,
        //         gradient: LinearGradient(
        //             begin: FractionalOffset.topCenter,
        //             end: FractionalOffset.bottomCenter,
        //             colors: [
        //               Colors.grey.withOpacity(0.0),
        //               Colors.black,
        //             ],
        //             stops: const [
        //               0.0,
        //               1.0
        //             ])),
        //   ),
        // ]),
        const ListTile(
          leading: Image(
              image: NetworkImage(
                  "https://raw.githubusercontent.com/JinZr/flutter_io_page/main/io_page/assets/images/avatar/avatar.jpeg")),
          title: Text("Zengrui JIN"),
          subtitle: Text("金增锐"),
        ),
        const Divider(indent: 10),
        const Column(
          children: [
            ListTile(title: MyIntroduction()),
            ListTile(title: SelectableText("zengrui.jin [at] icloud.com")),
            ListTile(
                title: SelectableText(
                    "Collecting vintage Polaroid cameras. (SLR680 & 670AF)")),
          ],
        ),
        const Divider(indent: 10),
        ButtonBar(alignment: MainAxisAlignment.start, children: [
          TextButton(
              child: const Text("GOOGLE SCHOLAR"),
              onPressed: () => _launchURL(
                  'https://scholar.google.com/citations?user=kgH1mk0AAAAJ&hl=en')),
          TextButton(
              child: const Text("RESEARCHGATE"),
              onPressed: () => _launchURL(
                  "https://www.researchgate.net/profile/Zengrui-Jin")),
        ])
      ],
    ));
  }

  _launchURL(String url) async => await canLaunchUrlString(url)
      ? await launchUrlString(url)
      : throw 'Could not launch $url';
}
