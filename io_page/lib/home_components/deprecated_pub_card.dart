import 'dart:convert' show json;

import 'package:flutter/material.dart';

import 'package:zr_jin_page/modal/pub_list_tile.dart';
import 'package:zr_jin_page/modal/pub_item.dart';
import 'package:zr_jin_page/utilities/error_view.dart';
import 'package:zr_jin_page/utilities/futures.dart';
import 'package:zr_jin_page/utilities/link_buttonbar.dart';

// ignore: must_be_immutable
class PublicationCard extends StatelessWidget {
  PublicationCard({super.key});

  late List<PublicationItem> _data;

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
          const Divider(indent: 10),
          FutureBuilder(
              future: futurePub(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var items = json.decode(snapshot.data.toString());
                  _data = generateItems(items);
                  return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: items.length <= 5 ? items.length : 5,
                      itemBuilder: (BuildContext context, int index) =>
                          PublicationListTile(item: _data[index]));
                } else if (snapshot.hasError) {
                  return buildErrorView(context, snapshot.error.toString());
                } else {
                  return const Center(child: LinearProgressIndicator());
                }
              })
        ]));
  }
}