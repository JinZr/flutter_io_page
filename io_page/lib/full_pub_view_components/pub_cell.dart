import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import 'pub_item.dart';
// import 'pub_cell_action.dart';
import '../home_components/author_text.dart';
import '../theme/author_list_text_theme.dart';

class FullPublicationCell extends StatelessWidget {
  final PublicationItem item;

  const FullPublicationCell({Key? key, required this.item}) : super(key: key);

  _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  _copyTitle(BuildContext context, PublicationItem item) {
    Clipboard.setData(ClipboardData(text: item.title));
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Title ${item.title} copied.")));
  }

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
          SelectableText(
            item.abs,
            style: Theme.of(context).textTheme.caption!,
            maxLines: isWideScreen ? null : 5,
            enableInteractiveSelection: true,
          ),
          const Divider(indent: 10.0),
          Row(
            children: [
              Chip(
                label: Text(
                  item.publisher,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                backgroundColor: Theme.of(context).colorScheme.surface,
              ),
              Chip(
                label: Text(
                  "${item.year}",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                backgroundColor: Theme.of(context).colorScheme.surface,
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

  Widget _buildButton(BuildContext context, PublicationItem item) => Row(
        children: [
          TextButton(
              onPressed: () => _launchURL(
                  "https://scholar.google.com/scholar?hl=en-US&as_sdt=0%2C5&q=${item.title}&btnG="),
              child: const Text("GOOGLE SCHOLAR")),
          OutlinedButton(
            onPressed: () => _launchURL(item.link),
            child: const Text("PDF"),
          )
        ],
      );

  Widget _buildIconButton(BuildContext context, PublicationItem item) => Row(
        children: [
          IconButton(
            onPressed: () => _launchURL(
                "https://scholar.google.com/scholar?hl=en-US&as_sdt=0%2C5&q=${item.title}&btnG="),
            icon: Icon(
              Icons.web,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
          IconButton(
            onPressed: () => _launchURL(item.link),
            icon: Icon(
              Icons.picture_as_pdf,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
            color: Theme.of(context).colorScheme.secondaryContainer,
          )
        ],
      );
}
