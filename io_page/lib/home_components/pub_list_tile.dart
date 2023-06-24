import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'author_text.dart';
import '../theme/author_list_text_theme.dart';
import '../full_pub_view_components/pub_item.dart';

class PublicationListTile extends StatefulWidget {
  final PublicationItem item;

  const PublicationListTile({Key? key, required this.item}) : super(key: key);

  @override
  State<PublicationListTile> createState() => _PublicationListTileState();
}

class _PublicationListTileState extends State<PublicationListTile> {
  _launchURL(String url) async => await canLaunchUrlString(url)
      ? await launchUrlString(url)
      : throw 'Could not launch $url';

  Widget _buildButton(BuildContext context, PublicationItem item) => ButtonBar(
        children: [
          TextButton(
            onPressed: () => _launchURL(
                "https://scholar.google.com/scholar?hl=en-US&as_sdt=0%2C5&q=${item.title}&btnG="),
            child: const Text("Search at Google Scholar"),
          ),
          ElevatedButton(
            onPressed: () => _launchURL(item.link),
            child: const Text("Download PDF"),
          )
        ],
      );

  Widget _buildIconButton(BuildContext context, PublicationItem item) =>
      ButtonBar(
        children: [
          IconButton(
            onPressed: () => _launchURL(
                "https://scholar.google.com/scholar?hl=en-US&as_sdt=0%2C5&q=${item.title}&btnG="),
            icon: const Icon(Icons.search),
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          IconButton(
            onPressed: () => _launchURL(item.link),
            icon: const Icon(Icons.picture_as_pdf),
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    // var screenSize = MediaQuery.of(context).size;
    // bool isWideScreen =
    // screenSize.height < screenSize.width - 200 && screenSize.width > 900;
    return ListTile(
      title: Text(widget.item.title),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              flex: 2,
              child: AuthorListText(
                  text: widget.item.authorList,
                  regularStyle: regularTextStyle(
                      Theme.of(context).brightness == Brightness.light,
                      Theme.of(context).textTheme.bodyLarge!.fontSize!),
                  matchStyle: matchTextStyle(
                      context,
                      Theme.of(context).brightness == Brightness.light,
                      Theme.of(context).textTheme.bodyLarge!.fontSize!))),
          const SizedBox(width: 8),
        ],
      ),
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return ListView(
                children: [
                  ListTile(
                      title: Text(widget.item.title),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              flex: 2,
                              child: AuthorListText(
                                  text: widget.item.authorList,
                                  regularStyle: regularTextStyle(
                                      Theme.of(context).brightness ==
                                          Brightness.light,
                                      Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .fontSize!),
                                  matchStyle: matchTextStyle(
                                      context,
                                      Theme.of(context).brightness ==
                                          Brightness.light,
                                      Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .fontSize!))),
                          const SizedBox(width: 8),
                        ],
                      ),
                      trailing: const CloseButton()),
                  const Divider(indent: 10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Text(widget.item.abs),
                  ),
                  const Divider(indent: 10),
                  Row(children: [
                    ButtonBar(children: [
                      Chip(label: Text(widget.item.publisher)),
                      Chip(label: Text("${widget.item.year}")),
                    ])
                  ]),
                  const Divider(indent: 10),
                  _buildButton(context, widget.item),
                ],
              );
            });
      },
    );
  }
}

// [
//         Padding(
//           padding: const EdgeInsets.fromLTRB(16.0, 0, 0, 0),
//           child: Text(
//             widget.item.abs,
//             style: Theme.of(context).textTheme.bodyLarge,
//           ),
//         ),
//         const Divider(indent: 10),
//         Row(
//           children: [
//             ButtonBar(
//               children: [
//                 Chip(
//                     avatar: const Icon(Icons.book),
//                     label: Text(widget.item.publisher)),
//                 Chip(
//                     avatar: const Icon(Icons.calendar_month),
//                     label: Text("${widget.item.year}")),
//               ],
//             ),
//             const Spacer(flex: 2),
//             if (isWideScreen) _buildButton(context, widget.item),
//           ],
//         ),
//         if (!isWideScreen) const Divider(indent: 10),
//         if (!isWideScreen) _buildIconButton(context, widget.item),
//       ]
