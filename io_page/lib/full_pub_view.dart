import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:zr_jin_page/utilities/launch_url.dart';
import 'package:zr_jin_page/modal/pub_item.dart';
import 'package:zr_jin_page/full_pub_view_components/pub_list_tile.dart';

// import 'hero_dialog_route.dart';

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
    return Center(
        child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(children: [
              Card(
                child: ListTile(
                  title: const Text(
                      "This list is updated manually. For more recent updates, please visit my Google Scholar or ResearchGate page."),
                  trailing: FilledButton.tonal(
                      child: const Text("Google Scholar"),
                      onPressed: () => launchURL(
                          'https://scholar.google.com/citations?user=kgH1mk0AAAAJ&hl=en')),
                ),
              ),
              Expanded(
                  child: FutureBuilder(
                      future: _futureString(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var items = json.decode(snapshot.data.toString());
                          _data = generateItems(items);
                          return _buildPanel();
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Column(children: [
                            const Icon(Icons.warning),
                            Text("${snapshot.error}")
                          ]));
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      }))
            ])));
  }

  Widget _buildPanel() => Center(
          child: ListView.separated(
        shrinkWrap: true,
        itemCount: _data.length,
        itemBuilder: (BuildContext context, int index) {
          return PublicationListTile(item: _data[index]);
        },
        separatorBuilder: (context, index) => const Divider(),
      ));
}
