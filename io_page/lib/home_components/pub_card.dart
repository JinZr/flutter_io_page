import 'dart:convert' show json;
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'pub_list_tile.dart';
import '../full_pub_view_components/pub_item.dart';

class PublicationCard extends StatefulWidget {
  const PublicationCard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PublicationCardState();
}

class _PublicationCardState extends State<PublicationCard> {
  late List<PublicationItem> _data;

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
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ListTile(
            leading: Icon(Icons.library_books),
            title: Text("Recent Publications"),
          ),
          const Divider(indent: 10),
          FutureBuilder(
              future: _futureString(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var items = json.decode(snapshot.data.toString());
                  _data = generateItems(items);
                  return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: items.length <= 5 ? items.length : 5,
                      itemBuilder: (BuildContext context, int index) {
                        return PublicationListTile(item: _data[index]);
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
              })
        ],
      ),
    );
  }
}
