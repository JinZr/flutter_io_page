import 'dart:convert' show json;
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'pub_list_tile.dart';

class PublicationCard extends StatefulWidget {
  const PublicationCard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PublicationCardState();
}

class _PublicationCardState extends State<PublicationCard> {
  Future<String> _futureString() async {
    final response = await http.Client().get(Uri.parse(
        'https://raw.githubusercontent.com/JinZr/flutter_io_page/main/io_page/assets/texts/publication_list.json'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load update');
    }
  }

  @override
  Widget build(BuildContext context) {
    // final assetStr = DefaultAssetBundle.of(context)
    //     .loadString('assets/texts/publication_list.json');

    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            leading: Icon(Icons.library_books,
                color: Theme.of(context).colorScheme.onSecondaryContainer),
            title: const Text("Publications"),
          ),
          const Divider(
            indent: 10,
          ),
          Padding(
              padding: const EdgeInsets.all(16),
              child: FutureBuilder(
                  future: _futureString(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var items = json.decode(snapshot.data.toString());
                      return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(indent: 10),
                          itemCount: items.length <= 5 ? items.length : 5,
                          itemBuilder: (BuildContext context, int index) {
                            return PublicationListTile(json: items[index]);
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
