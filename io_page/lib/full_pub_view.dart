import 'dart:convert' show json;
import 'package:flutter/material.dart';

import 'full_pub_view_components/pub_item.dart';

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

    return SingleChildScrollView(
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
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((PublicationItem item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.json.toString()),
            );
          },
          body: ListTile(
            title: Text(item.json.toString() +
                item.json.toString() +
                item.json.toString()),
            subtitle:
                const Text('To delete this panel, tap the trash can icon'),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
