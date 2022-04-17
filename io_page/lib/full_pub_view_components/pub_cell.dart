import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import 'pub_item.dart';
import '../home_components/author_text.dart';
import 'pub_cell_action.dart';

class FullPublicationCell extends StatelessWidget {
  final PublicationItem item;

  const FullPublicationCell({Key? key, required this.item}) : super(key: key);

  _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  @override
  Widget build(BuildContext context) {
    
    return ListTile(
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
                    _launchURL(item.link);
                    break;
                  case PublicationTileDropdownMenuAction.copyTitle:
                    Clipboard.setData(
                        ClipboardData(text: item.title));
                    break;
                  case PublicationTileDropdownMenuAction.copyAuthor:
                    Clipboard.setData(
                        ClipboardData(text: item.authorList));
                    break;
                }
              }),
        title: Text(
            "[${item.publisher}] ${item.title}",
          ),
        subtitle: AuthorListText(
            text: item.authorList,
            regularStyle: Theme.of(context).textTheme.bodyText1!,
            matchStyle: Theme.of(context).textTheme.bodyText2!),
        );
  }
}
