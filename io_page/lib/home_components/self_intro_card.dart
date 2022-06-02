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
        Stack(children: <Widget>[
          Container(
            height: 350,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/avatar/avatar.jpeg')),
            ),
          ),
          Container(
            height: 350,
            decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.grey.withOpacity(0.0),
                      Colors.black,
                    ],
                    stops: const [
                      0.0,
                      1.0
                    ])),
          ),
        ]),
        // Image.asset('assets/images/avatar/avatar.jpeg'),
        ExpansionTile(
          leading: Icon(Icons.person,
              color: Theme.of(context).colorScheme.onSecondaryContainer),
          title: const Text("Zengrui JIN"),
          subtitle: const Text("金增锐"),
          initiallyExpanded: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const ListTile(
                      leading: Icon(Icons.info), title: MyIntroduction()),
                  ListTile(
                    leading: const Icon(Icons.mail),
                    title: SelectableText(
                      "zengrui.jin [at] icloud.com",
                      style: Theme.of(context).textTheme.bodyMedium!,
                      enableInteractiveSelection: true,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.favorite),
                    title: SelectableText(
                      "Collecting vintage Polaroid cameras. (SLR680 & 670AF)",
                      style: Theme.of(context).textTheme.bodyMedium!,
                      enableInteractiveSelection: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        ButtonBar(alignment: MainAxisAlignment.start, children: [
          TextButton(
              child: const Text("GOOGLE SCHOLAR"),
              onPressed: () => _launchURL(
                  'https://scholar.google.com/citations?user=kgH1mk0AAAAJ&hl=en')),
          TextButton(
              child: const Text("RESEARCH GATE"),
              onPressed: () => _launchURL(
                  "https://www.researchgate.net/profile/Zengrui-Jin")),
          // TextButton(
          //     child: const Text("CURRICULUM VITAE"),
          //     onPressed: () => {
          //           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          //               content: Text("My CV is not available so far.")))
          //         }),
        ])
      ],
    ));
  }

  _launchURL(String url) async => await canLaunchUrlString(url)
      ? await launchUrlString(url)
      : throw 'Could not launch $url';
}
