import 'dart:convert' show json;
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

  @override
  Widget build(BuildContext context) {
    final assetStr = DefaultAssetBundle.of(context)
        .loadString('assets/texts/publication_list.json');

    return Center(
      child: FutureBuilder(
        future: assetStr,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var items = json.decode(snapshot.data.toString());
            _data = generateItems(items);
            return _buildPanel();
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
