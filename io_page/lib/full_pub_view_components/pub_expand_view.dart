import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'pub_item.dart';
import '../home_components/author_text.dart';
import '../theme/author_list_text_theme.dart';
import 'custom_rect_tween.dart';

class FullPublicationExpandView extends StatefulWidget {
  final PublicationItem item;
  final int tag;

  const FullPublicationExpandView(
      {Key? key, required this.item, required this.tag})
      : super(key: key);

  @override
  State<FullPublicationExpandView> createState() =>
      _FullPublicationExpandViewState();
}

class _FullPublicationExpandViewState extends State<FullPublicationExpandView> {
  _launchURL(String url) async => await canLaunchUrlString(url)
      ? await launchUrlString(url)
      : throw 'Could not launch $url';

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool isWideScreen =
        screenSize.height < screenSize.width - 200 && screenSize.width > 900;

    return Hero(
        tag: widget.tag,
        createRectTween: (begin, end) {
          return CustomRectTween(begin: begin!, end: end!);
        },
        child: SingleChildScrollView(
            child: Card(
          child: ListTile(
            title: SelectableText(widget.item.title),
            trailing: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            subtitle:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              AuthorListText(
                  text: widget.item.authorList,
                  regularStyle: regularTextStyle(
                      Theme.of(context).brightness == Brightness.light,
                      Theme.of(context).textTheme.bodyLarge!.fontSize!),
                  matchStyle: matchTextStyle(
                      context,
                      Theme.of(context).brightness == Brightness.light,
                      Theme.of(context).textTheme.bodyLarge!.fontSize!)),
              const Divider(indent: 10.0),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SelectableText(
                    widget.item.abs,
                    style: Theme.of(context).textTheme.bodyLarge!,
                  )),
              const Divider(indent: 10.0),
              Row(
                children: [
                  ButtonBar(
                    children: [
                      Chip(
                          avatar: const Icon(Icons.book),
                          label: Text(widget.item.publisher)),
                      Chip(
                          avatar: const Icon(Icons.calendar_month),
                          label: Text("${widget.item.year}")),
                    ],
                  ),
                  const Spacer(flex: 2),
                  if (isWideScreen) _buildButton(context, widget.item)
                ],
              ),
              if (!isWideScreen) _buildIconButton(context, widget.item)
            ]),
          ),
        )));
  }

  // Widget _buildChipBar(BuildContext context, PublicationItem item) => ButtonBar(
  //       children: [
  //         InkWell(
  //             child: ActionChip(
  //           // avatar: const Icon(Icons.search),
  //           // backgroundColor: Theme.of(context).colorScheme.surface,
  //           onPressed: () => _launchURL(
  //               "https://scholar.google.com/scholar?hl=en-US&as_sdt=0%2C5&q=${item.title}&btnG="),
  //           labelStyle: TextStyle(
  //             fontSize: Theme.of(context).textTheme.button!.fontSize,
  //             color: Theme.of(context).colorScheme.onSurface,
  //           ),
  //           label: const Text("Search at Google Scholar"),
  //         )),
  //         InkWell(
  //             child: ActionChip(
  //           // avatar: const Icon(Icons.picture_as_pdf),
  //           // backgroundColor: Theme.of(context).colorScheme.surface,
  //           onPressed: () => _launchURL(item.link),
  //           labelStyle: TextStyle(
  //             fontSize: Theme.of(context).textTheme.button!.fontSize,
  //             color: Theme.of(context).colorScheme.onSurface,
  //           ),
  //           label: const Text("Download PDF"),
  //         ))
  //       ],
  //     );

  Widget _buildButton(BuildContext context, PublicationItem item) => ButtonBar(
        children: [
          TextButton(
            onPressed: () => _launchURL(
                "https://scholar.google.com/scholar?hl=en-US&as_sdt=0%2C5&q=${widget.item.title}&btnG="),
            child: const Text("Search at Google Scholar"),
          ),
          FilledButton.tonal(
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
                "https://scholar.google.com/scholar?hl=en-US&as_sdt=0%2C5&q=${widget.item.title}&btnG="),
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
}
