import 'package:flutter/material.dart';

import 'dart:convert' show json;
import 'package:url_launcher/url_launcher.dart';
import 'update_list_tile.dart';

class UpdateList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UpdateListState();
}

class _UpdateListState extends State<UpdateList> {
  @override
  Widget build(BuildContext context) {
    final assetStr = DefaultAssetBundle.of(context)
        .loadString('assets/texts/latest_update_list.json');
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            leading: const Icon(Icons.fiber_new),
            title: Text("News", style: Theme.of(context).textTheme.headline6!),
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
                        itemCount: items.length <= 10 ? items.length : 10,
                        itemBuilder: (BuildContext context, int index) {
                          return UpdateEventListTile(json: items[index]);
                        });
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ))
        ],
      ),
    );
  }

  _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
