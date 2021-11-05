import 'dart:convert' show json;

import 'package:flutter/material.dart';

import 'pub_list_tile.dart';

class PublicationList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PublicationListState();
}

class _PublicationListState extends State<PublicationList> {
  @override
  Widget build(BuildContext context) {
    final assetStr = DefaultAssetBundle.of(context)
        .loadString('assets/texts/publication_list.json');

    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ListTile(
            leading: Icon(Icons.book),
            title: Text("Publications"),
          ),
          const Divider(
            indent: 10,
          ),
          Padding(
              padding: const EdgeInsets.all(16),
              child: FutureBuilder(
                  future: assetStr,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var items = json.decode(snapshot.data.toString());
                      return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            return PublicationListTile(json: items[index]);
                          });
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }))
        ],
      ),
    );
  }
}
