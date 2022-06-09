import 'package:flutter/material.dart';

import 'dart:convert' show json;
import 'update_list_tile.dart';

class UpdateCard extends StatefulWidget {
  const UpdateCard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _UpdateCardState();
}

class _UpdateCardState extends State<UpdateCard> {
  @override
  Widget build(BuildContext context) {
    final assetStr = DefaultAssetBundle.of(context)
        .loadString('assets/texts/latest_update_list.json');

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            leading: Icon(Icons.fiber_new,
                color: Theme.of(context).colorScheme.onSecondaryContainer),
            title: const Text("News"),
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
}
