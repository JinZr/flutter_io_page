import 'dart:convert' show json;

import 'package:flutter/material.dart';

import 'package:zr_jin_page/utilities/launch_url.dart';
import 'package:zr_jin_page/utilities/futures.dart';
import 'package:zr_jin_page/modal/pub_item.dart';
import 'package:zr_jin_page/modal/pub_list_tile.dart';

// ignore: must_be_immutable
class FullPublicationView extends StatelessWidget {
  FullPublicationView({Key? key}) : super(key: key);

  late List<PublicationItem> _data;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(children: [
              Card(
                  child: ListTile(
                      title: const Text(
                          "This list is updated manually. For more recent updates, please visit my Google Scholar or ResearchGate page."),
                      trailing: FilledButton.tonal(
                          child: const Text("Google Scholar"),
                          onPressed: () => launchURL(
                              'https://scholar.google.com/citations?user=kgH1mk0AAAAJ&hl=en')))),
              Expanded(
                  child: FutureBuilder(
                      future: futurePub(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var items = json.decode(snapshot.data.toString());
                          _data = generateItems(items);
                          return _buildPanel();
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Column(children: [
                            const Icon(Icons.warning),
                            Text("${snapshot.error}")
                          ]));
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      }))
            ])));
  }

  Widget _buildPanel() => Center(
      child: ListView.separated(
          shrinkWrap: true,
          itemCount: _data.length,
          itemBuilder: (BuildContext context, int index) {
            return PublicationListTile(item: _data[index]);
          },
          separatorBuilder: (context, index) => const Divider()));
}
