import 'package:flutter/material.dart';

class UpdateList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // children: const [
        //   Text("[News]"),
        //   Text("[2020]: One paper accepted by InterSpeech 2021."),
        // ],
        children: const [
          ListTile(
            title: Text(
              "[News]",
              softWrap: true,
            ),
          ),
          ListTile(
            title: Text(
              '[2020]: One paper accepted by INTERSPEECH 2021.',
              softWrap: true,
            ),
          )
        ],
      ),
    );
  }
}
