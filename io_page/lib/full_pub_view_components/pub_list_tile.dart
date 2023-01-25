import 'package:flutter/material.dart';

import 'pub_item.dart';
import '../home_components/author_text.dart';
import '../theme/author_list_text_theme.dart';
import 'custom_rect_tween.dart';

class PublicationListTile extends StatelessWidget {
  const PublicationListTile({
    Key? key,
    required PublicationItem item,
    required this.tag,
  })  : _data = item,
        super(key: key);

  final PublicationItem _data;
  final int tag;

  @override
  Widget build(BuildContext context) {
    return Hero(
        createRectTween: (begin, end) {
          return CustomRectTween(begin: begin!, end: end!);
        },
        tag: tag,
        child: Card(
            child: Column(children: [
          ListTile(
            title: Text(_data.title),
            subtitle: AuthorListText(
                text: _data.authorList,
                regularStyle: regularTextStyle(
                    Theme.of(context).brightness == Brightness.light,
                    Theme.of(context).textTheme.bodyLarge!.fontSize!),
                matchStyle: matchTextStyle(
                    Theme.of(context).brightness == Brightness.light,
                    Theme.of(context).textTheme.bodyLarge!.fontSize!)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 2.0, 4.0, 4.0),
            child: Row(
              children: [
                Chip(
                  label: Text("${_data.publisher} · ${_data.year}"),
                ),
              ],
            ),
          )
        ])));
  }
}
