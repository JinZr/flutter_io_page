import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'pub_item.dart';
import '../home_components/author_text.dart';
import '../theme/author_list_text_theme.dart';

class FullPublicationCell extends StatelessWidget {
  final PublicationItem item;

  const FullPublicationCell({Key? key, required this.item}) : super(key: key);

  _launchURL(String url) async => await canLaunchUrlString(url)
      ? await launchUrlString(url)
      : throw 'Could not launch $url';

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool isWideScreen =
        screenSize.height < screenSize.width - 200 && screenSize.width > 900;

    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: SelectableText(
          item.title,
          enableInteractiveSelection: true,
        ),
        subtitle:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AuthorListText(
              text: item.authorList,
              regularStyle: regularTextStyle(
                  Theme.of(context).brightness == Brightness.light,
                  Theme.of(context).textTheme.bodyMedium!.fontSize!),
              matchStyle: matchTextStyle(
                  Theme.of(context).brightness == Brightness.light,
                  Theme.of(context).textTheme.bodyMedium!.fontSize!)),
          const Divider(indent: 10.0),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: SelectableText(
                item.abs,
                style: Theme.of(context).textTheme.caption!,
                maxLines: isWideScreen ? null : 5,
                enableInteractiveSelection: true,
              )),
          const Divider(indent: 10.0),
          Row(
            children: [
              ButtonBar(
                children: [
                  Chip(
                    label: Text(
                      item.publisher,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.surface,
                  ),
                  Chip(
                    label: Text(
                      "${item.year}",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.surface,
                  ),
                ],
              ),
              const Spacer(flex: 2),
              isWideScreen
                  ? _buildButton(context, item)
                  : _buildIconButton(context, item)
            ],
          )
        ]),
      ),
    ));
  }

  Widget _buildButton(BuildContext context, PublicationItem item) => ButtonBar(
        children: [
          TextButton(
              onPressed: () => _launchURL(
                  "https://scholar.google.com/scholar?hl=en-US&as_sdt=0%2C5&q=${item.title}&btnG="),
              child: const Text("GOOGLE SCHOLAR"),
              ),
          ElevatedButton(
            onPressed: () => _launchURL(item.link),
            style: Theme.of(context).elevatedButtonTheme.style,
            child: const Text("PDF"),
          )
        ],
      );

  Widget _buildIconButton(BuildContext context, PublicationItem item) =>
      ButtonBar(
        children: [
          IconButton(
            onPressed: () => _launchURL(
                "https://scholar.google.com/scholar?hl=en-US&as_sdt=0%2C5&q=${item.title}&btnG="),
            icon: const Icon(Icons.web),
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
