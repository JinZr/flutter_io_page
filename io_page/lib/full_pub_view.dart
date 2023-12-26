import 'dart:convert' show json;

import 'package:flutter/material.dart';

import 'package:zr_jin_page/utilities/futures.dart';
import 'package:zr_jin_page/modal/pub_item.dart';
import 'package:zr_jin_page/modal/pub_list_tile.dart';
import 'package:zr_jin_page/utilities/link_buttonbar.dart';
import 'package:zr_jin_page/utilities/error_view.dart';

// ignore: must_be_immutable
class FullPublicationView extends StatelessWidget {
  FullPublicationView({super.key});

  late List<PublicationItem> _data;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Card(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Theme.of(context).colorScheme.outline),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          child: Column(children: [
            const ListTile(
                title: Text(
                    "Please visit my Google Scholar or ResearchGate for more recent updates.")),
            linkButtonBar
          ])),
      Expanded(
          child: FutureBuilder(
              future: futurePub(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var items = json.decode(snapshot.data.toString());
                  _data = generateItems(items);
                  return _buildPanel();
                } else if (snapshot.hasError) {
                  return buildErrorView(context, snapshot.error.toString());
                } else {
                  return const Center(child: LinearProgressIndicator());
                }
              }))
    ]));
  }

  Widget _buildPanel() => ListView.separated(
      shrinkWrap: true,
      itemCount: _data.length,
      itemBuilder: (BuildContext context, int index) =>
          PublicationListTile(item: _data[index]),
      separatorBuilder: (context, index) => const Divider());
}
