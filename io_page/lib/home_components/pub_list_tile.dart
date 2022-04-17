import 'package:flutter/material.dart';

import 'author_text.dart';

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
          title: Text(
            "[${widget.json["publisher"]}] ${widget.json["title"]}",
          ),
          subtitle: AuthorListText(
              text: widget.json["author"],
              regularStyle: Theme.of(context).textTheme.bodyText1!,
              matchStyle: Theme.of(context).textTheme.bodyText2!),
        ),
      );

}
