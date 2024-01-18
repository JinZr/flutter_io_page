import 'package:flutter/material.dart';

import 'package:zr_jin_page/utilities/link_buttonbar.dart';

// ignore: must_be_immutable
class PublicationCard extends StatelessWidget {
  const PublicationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
          const ListTile(
              leading: Icon(Icons.library_books),
              title: Text("Recent Publications",
                  style: TextStyle(fontWeight: FontWeight.bold))),
          const Divider(indent: 10),
          const ListTile(
              title: Text(
                  "Please visit my Google Scholar or ResearchGate for more recent updates.")),
          linkButtonBar,
        ]));
  }
}
