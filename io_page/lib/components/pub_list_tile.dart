import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:url_launcher/url_launcher.dart';
import 'author_text.dart';
import 'pub_tile_action.dart';

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
          // trailing: IconButton(
          // icon: const Icon(Icons.more_vert),
          // onPressed: () => _launchURL(widget.json["link"]),
          // ),
          trailing: PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<PublicationTileDropdownMenuAction>>[
                    const PopupMenuItem(
                        value: PublicationTileDropdownMenuAction.openInBrowser,
                        child: Text("Open in Browser")),
                    const PopupMenuDivider(),
                    const PopupMenuItem(
                        value: PublicationTileDropdownMenuAction.copyTitle,
                        child: Text("Copy Title")),
                    const PopupMenuItem(
                        value: PublicationTileDropdownMenuAction.copyAuthor,
                        child: Text("Copy Author List")),
                  ],
              onSelected: (PublicationTileDropdownMenuAction action) {
                switch (action) {
                  case PublicationTileDropdownMenuAction.openInBrowser:
                    _launchURL(widget.json["link"]);
                    break;
                  case PublicationTileDropdownMenuAction.copyTitle:
                    Clipboard.setData(
                        ClipboardData(text: widget.json["title"]));
                    break;
                  case PublicationTileDropdownMenuAction.copyAuthor:
                    Clipboard.setData(
                        ClipboardData(text: widget.json["author"]));
                    break;
                }
              }),
          title: Text(
            "[${widget.json["publisher"]}] ${widget.json["title"]}",
          ),
          subtitle: AuthorListText(
              text: widget.json["author"],
              regularStyle: Theme.of(context).textTheme.bodyText1!,
              matchStyle: Theme.of(context).textTheme.bodyText2!),
        ),
      );

  _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
