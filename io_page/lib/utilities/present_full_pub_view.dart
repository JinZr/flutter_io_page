import 'package:flutter/material.dart';
import 'package:zr_jin_page/utilities/author_text.dart';
import 'package:zr_jin_page/theme/author_list_text_theme.dart';
import 'package:zr_jin_page/modal/pub_item.dart';
import 'package:zr_jin_page/utilities/launch_url.dart';

void presentFullPubView(BuildContext context, PublicationItem item) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(children: [
          ListTile(
              title: Text(item.title),
              subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        flex: 2,
                        child: AuthorListText(
                            text: item.authorList,
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
                    const SizedBox(width: 8)
                  ]),
              trailing: const CloseButton()),
          const Divider(indent: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Text(item.abs),
          ),
          const Divider(indent: 10),
          Row(children: [
            ButtonBar(children: [
              Chip(label: Text(item.publisher)),
              Chip(label: Text("${item.year}")),
            ])
          ]),
          const Divider(indent: 10),
          _buildButton(context, item),
        ]);
      });
}

Widget _buildButton(BuildContext context, PublicationItem item) => ButtonBar(
      children: [
        FilledButton.tonal(
          onPressed: () => launchURL(
              "https://scholar.google.com/scholar?hl=en-US&as_sdt=0%2C5&q=${item.title}&btnG="),
          child: const Text("Search at Google Scholar"),
        ),
        FilledButton(
          onPressed: () => launchURL(item.link),
          child: const Text("Download PDF"),
        )
      ],
    );
