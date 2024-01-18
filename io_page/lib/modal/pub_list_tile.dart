import 'package:flutter/material.dart';

import 'package:zr_jin_page/modal/pub_item.dart';
import 'package:zr_jin_page/utilities/author_text.dart';
import 'package:zr_jin_page/theme/author_list_text_theme.dart';

class PublicationListTile extends StatelessWidget {
  const PublicationListTile({
    super.key,
    required PublicationItem item,
  }) : _data = item;

  final PublicationItem _data;

  @override
  Widget build(BuildContext context) {
    final authorList = AuthorListText(
        text: _data.authorList,
        regularStyle: regularTextStyle(
            Theme.of(context).brightness == Brightness.light,
            Theme.of(context).textTheme.bodyLarge!.fontSize!),
        matchStyle: matchTextStyle(
            context,
            Theme.of(context).brightness == Brightness.light,
            Theme.of(context).textTheme.bodyLarge!.fontSize!));
    return ListTile(title: Text(_data.title), subtitle: authorList);
    // return ListTile(
    //     title: Text(_data.title),
    //     subtitle: authorList,
    //     onTap: () => presentFullPubView(context, _data, authorList));
  }
}
