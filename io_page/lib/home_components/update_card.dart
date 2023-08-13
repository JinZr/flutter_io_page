import 'package:flutter/material.dart';

import 'update_list_tile.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UpdateCard extends StatefulWidget {
  const UpdateCard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _UpdateCardState();
}

class _UpdateCardState extends State<UpdateCard> {
  Future<List<dynamic>> _futureList() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/JinZr/flutter_io_page/main/io_page/assets/texts/latest_update_list.json'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data;
    } else {
      throw Exception('Failed to load update');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ListTile(
            leading: Icon(Icons.fiber_new),
            title: Text(
              "News",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(
            indent: 10,
          ),
          FutureBuilder<List<dynamic>>(
            future: _futureList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final items = snapshot.data!;
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: items.length > 5 ? 5 : items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return UpdateEventListTile(json: items[index]);
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Column(
                    children: [
                      const Icon(Icons.warning),
                      Text("${snapshot.error}"),
                    ],
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
