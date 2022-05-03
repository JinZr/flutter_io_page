import 'package:flutter/material.dart';

class UpdateEventListTile extends StatelessWidget {
  final dynamic json;

  const UpdateEventListTile({Key? key, this.json}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(title: 
      Text(
        "[${json["date"]}]: ${json["content"]}",
        style: Theme.of(context).textTheme.bodyText1!,
      )
    );
  }
}
