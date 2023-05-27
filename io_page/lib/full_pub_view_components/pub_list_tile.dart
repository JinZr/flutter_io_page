import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'pub_item.dart';
import '../home_components/author_text.dart';
import '../theme/author_list_text_theme.dart';
import 'custom_rect_tween.dart';

class PublicationListTile extends StatelessWidget {
  const PublicationListTile({
    Key? key,
    required PublicationItem item,
    required this.tag,
  })  : _data = item,
        super(key: key);

  final PublicationItem _data;
  final int tag;

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
          FilledButton.tonal(
            onPressed: () => _launchURL(item.link),
            child: const Text("Download PDF"),
          )
        ],
      );

  // @override
  // Widget build(BuildContext context) {
  //   return Hero(
  //       createRectTween: (begin, end) {
  //         return CustomRectTween(begin: begin!, end: end!);
  //       },
  //       tag: tag,
  //       child: Card(
  //           child: ListTile(
  //               title: Text(_data.title),
  //               subtitle: AuthorListText(
  //                   text: _data.authorList,
  //                   regularStyle: regularTextStyle(
  //                       Theme.of(context).brightness == Brightness.light,
  //                       Theme.of(context).textTheme.bodyLarge!.fontSize!),
  //                   matchStyle: matchTextStyle(
  //                       context,
  //                       Theme.of(context).brightness == Brightness.light,
  //                       Theme.of(context).textTheme.bodyLarge!.fontSize!)))));
  // }
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_data.title),
      subtitle: AuthorListText(
          text: _data.authorList,
          regularStyle: regularTextStyle(
              Theme.of(context).brightness == Brightness.light,
              Theme.of(context).textTheme.bodyLarge!.fontSize!),
          matchStyle: matchTextStyle(
              context,
              Theme.of(context).brightness == Brightness.light,
              Theme.of(context).textTheme.bodyLarge!.fontSize!)),
      onTap: () {
        showBottomSheet(
            context: context,
            builder: (context) {
              return ListView(
                children: [
                  ListTile(
                    title: Text(_data.title),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            flex: 2,
                            child: AuthorListText(
                                text: _data.authorList,
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
                    trailing: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                    ),
                  ),
                  const Divider(indent: 10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Text(
                      _data.abs,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  const Divider(indent: 10),
                  Row(children: [
                    ButtonBar(children: [
                      Chip(
                          avatar: const Icon(Icons.book),
                          label: Text(_data.publisher)),
                      Chip(
                          avatar: const Icon(Icons.calendar_month),
                          label: Text("${_data.year}")),
                    ])
                  ]),
                  const Divider(indent: 10),
                  _buildButton(context, _data),
                ],
              );
            });
      },
    );
  }
}
