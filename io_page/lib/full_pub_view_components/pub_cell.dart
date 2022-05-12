import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import 'pub_item.dart';
// import 'pub_cell_action.dart';
import '../home_components/author_text.dart';
import '../utilities/chip_color.dart';

class FullPublicationCell extends StatelessWidget {
  final PublicationItem item;

  const FullPublicationCell({Key? key, required this.item}) : super(key: key);

  _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  _copyTitle(BuildContext context, PublicationItem item) {
    Clipboard.setData(ClipboardData(text: item.title));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Title ${item.title} copied."))
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    // final popupMenuButton = PopupMenuButton(
    //           icon: const Icon(Icons.more_vert),
    //           itemBuilder: (BuildContext context) =>
    //               <PopupMenuEntry<PublicationTileDropdownMenuAction>>[
    //                 PopupMenuItem(
    //                     value: PublicationTileDropdownMenuAction.openInBrowser,
    //                     child: Text(
    //                       "Open in Browser",
    //                       style: Theme.of(context).textTheme.caption,
    //                     )),
    //                 const PopupMenuDivider(),
    //                 PopupMenuItem(
    //                     value: PublicationTileDropdownMenuAction.copyTitle,
    //                     child: Text(
    //                       "Copy Title",
    //                       style: Theme.of(context).textTheme.caption,
    //                     )),
    //                 PopupMenuItem(
    //                     value: PublicationTileDropdownMenuAction.copyAuthor,
    //                     child: Text("Copy Author List",
    //                         style: Theme.of(context).textTheme.caption)),
    //               ],
    //           onSelected: (PublicationTileDropdownMenuAction action) {
    //             switch (action) {
    //               case PublicationTileDropdownMenuAction.openInBrowser:
    //                 _launchURL(item.link);
    //                 break;
    //               case PublicationTileDropdownMenuAction.copyTitle:
    //                 Clipboard.setData(ClipboardData(text: item.title));
    //                 break;
    //               case PublicationTileDropdownMenuAction.copyAuthor:
    //                 Clipboard.setData(ClipboardData(text: item.authorList));
    //                 break;
    //             }
    //           });

    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          item.title,
          style: Theme.of(context).textTheme.bodyText1!,
        ),
        subtitle:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AuthorListText(
              text: item.authorList,
              regularStyle: Theme.of(context).textTheme.subtitle1!,
              matchStyle: Theme.of(context).textTheme.bodyText2!),
          const Divider(indent: 10.0),
          Text(
            item.abs,
            style: Theme.of(context).textTheme.caption!,
            maxLines: screenSize.height < screenSize.width - 100 ? null : 3,
          ),
          const Divider(indent: 10.0),
          Row(
            children: [
              Chip(
                label: Text(
                  item.publisher,
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                backgroundColor: Theme.of(context).colorScheme.surface,
              ),
              Chip(
                label: Text(
                  "${item.year}",
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                backgroundColor: Theme.of(context).colorScheme.surface,
              ),
              const Spacer(flex: 2),
              ElevatedButton(
                onPressed: () => _launchURL("https://scholar.google.com/scholar?hl=en-US&as_sdt=0%2C5&q=${item.title}&btnG="), 
                child: const Text("Google Scholar")
              ),
              ElevatedButton(
                onPressed: () => _launchURL(item.link),
                child: const Text("PDF"),
              )
          ],)
        ]),
      ),
    ));
  }
}
