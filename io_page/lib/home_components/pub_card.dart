import 'dart:convert' show json;

import 'package:flutter/material.dart';

import 'package:zr_jin_page/modal/pub_list_tile.dart';
import 'package:zr_jin_page/modal/pub_item.dart';
import 'package:zr_jin_page/utilities/futures.dart';

// ignore: must_be_immutable
class PublicationCard extends StatelessWidget {
  PublicationCard({Key? key}) : super(key: key);

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
                  return Center(
                      child: Column(children: [
                    const Icon(Icons.warning),
                    Text("${snapshot.error}")
                  ]));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              })
        ]));
  }
}
