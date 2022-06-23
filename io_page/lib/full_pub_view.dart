import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'full_pub_view_components/pub_item.dart';
import 'full_pub_view_components/pub_cell.dart';

/// This is the stateful widget that the main application instantiates.
class FullPublicationView extends StatefulWidget {
  const FullPublicationView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FullPublicationView> createState() => _FullPublicationViewState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _FullPublicationViewState extends State<FullPublicationView> {
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
    // final assetStr = DefaultAssetBundle.of(context)
    // .loadString('assets/texts/publication_list.json');

    return Center(
      child: FutureBuilder(
        future: _futureString(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var items = json.decode(snapshot.data.toString());
            _data = generateItems(items);
            return _buildPanel();
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
        },
      ),
    );
  }

  Widget _buildPanel() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: _data.length,
      itemBuilder: (BuildContext context, int index) {
        return FullPublicationCell(item: _data[index]);
      },
    );
  }
}
