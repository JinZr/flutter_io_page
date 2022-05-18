import 'package:flutter/material.dart';

import 'author_text.dart';
import '../theme/author_list_text_theme.dart';

class PublicationListTile extends StatefulWidget {
  final dynamic json;

  const PublicationListTile({Key? key, this.json}) : super(key: key);

  @override
  State<PublicationListTile> createState() => _PublicationListTileState();
}

class _PublicationListTileState extends State<PublicationListTile> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    if (screenSize.height >= screenSize.width - 100) {
      return InkWell(
          child: ListTile(
        title: SelectableText(
          "${widget.json["title"]}",
          enableInteractiveSelection: true,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        subtitle:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AuthorListText(
              text: widget.json["author"],
              regularStyle: regularTextStyle(
                  Theme.of(context).brightness == Brightness.light,
                  Theme.of(context).textTheme.bodySmall!.fontSize!
              ),
              matchStyle: matchTextStyle(
                  Theme.of(context).brightness == Brightness.light,
                  Theme.of(context).textTheme.bodyMedium!.fontSize!)),
          Chip(
            label: Text(
              widget.json["publisher"],
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            backgroundColor: Theme.of(context).colorScheme.surface,
          ),
        ]),
      ));
    } else {
      return InkWell(
        child: ListTile(
          leading: Chip(
            label: Text(
              widget.json["publisher"],
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            backgroundColor: Theme.of(context).colorScheme.surface,
          ),
          title: Text(
            "${widget.json["title"]}",
          ),
          subtitle: AuthorListText(
              text: widget.json["author"],
              regularStyle: regularTextStyle(
                  Theme.of(context).brightness == Brightness.light,
                  Theme.of(context).textTheme.bodyMedium!.fontSize!
              ),
              matchStyle: matchTextStyle(
                  Theme.of(context).brightness == Brightness.light,
                  Theme.of(context).textTheme.bodyMedium!.fontSize!)),
        ),
      );
    }
  }
}
