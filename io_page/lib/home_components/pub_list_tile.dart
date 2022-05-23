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
  Widget build(BuildContext context) => InkWell(
        child: ListTile(
          title: SelectableText(
            "${widget.json["title"]}",
            enableInteractiveSelection: true,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  flex: 2,
                  child: AuthorListText(
                      text: widget.json["author"],
                      regularStyle: regularTextStyle(
                          Theme.of(context).brightness == Brightness.light,
                          Theme.of(context).textTheme.bodyMedium!.fontSize!),
                      matchStyle: matchTextStyle(
                          Theme.of(context).brightness == Brightness.light,
                          Theme.of(context).textTheme.bodyMedium!.fontSize!))),
              const SizedBox(
                width: 8,
              ),
              Chip(
                label: Text(
                  widget.json["publisher"],
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                backgroundColor: Theme.of(context).colorScheme.surface,
              ),
            ],
          ),
        ),
      );
}
