import 'package:flutter/material.dart';

import 'dart:convert' show json;
import 'update_list_tile.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UpdateCard extends StatefulWidget {
  const UpdateCard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _UpdateCardState();
}

class _UpdateCardState extends State<UpdateCard> {
  Future<String> _futureString() async {
    final response = await http.Client().get(Uri.parse(
        'https://raw.githubusercontent.com/JinZr/flutter_io_page/main/io_page/assets/texts/latest_update_list.json'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load update');
    }
  }

  @override
  Widget build(BuildContext context) {
    // final assetStr = DefaultAssetBundle.of(context)
    // .loadString('assets/texts/latest_update_list.json');

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
          FutureBuilder(
            future: _futureString(),
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
              } else if (snapshot.hasError) {
                return Center(
                  child: Column(
                    children: [
                      const Icon(Icons.warning),
                      Text("${snapshot.error}")
                    ],
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          )
        ],
      ),
    );
  }
}
