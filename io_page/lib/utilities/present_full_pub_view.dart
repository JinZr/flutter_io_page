import 'package:flutter/material.dart';
import 'package:zr_jin_page/utilities/author_text.dart';
import 'package:zr_jin_page/modal/pub_item.dart';
import 'package:zr_jin_page/utilities/launch_url.dart';
import 'package:zr_jin_page/utilities/custom_chip.dart';

void presentFullPubView(
    BuildContext context, PublicationItem item, AuthorListText authorList) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(children: [
          ListTile(
              title: SelectableText(item.title),
              subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(flex: 2, child: authorList),
                    const SizedBox(width: 8)
                  ]),
              trailing: const CloseButton()),
          const Divider(indent: 10),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: SelectableText(item.abs)),
          const Divider(indent: 10),
          Row(children: [
            ButtonBar(children: [
              CustomChip(str: item.publisher),
              CustomChip(str: "${item.year}"),
            ])
          ]),
          const Divider(indent: 10),
          _buildButton(context, item),
        ]);
      });
}

Widget _buildButton(BuildContext context, PublicationItem item) =>
    ButtonBar(children: [
      OutlinedButton(
          onPressed: () => launchURL(item.link), child: const Text("Download")),
      FilledButton(
          onPressed: () => launchURL(
              "https://scholar.google.com/scholar?hl=en-US&as_sdt=0%2C5&q=${item.title}&btnG="),
          child: const Text("Google Scholar")),
    ]);
