import 'package:flutter/material.dart';

class UpdateList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          ListTile(
            leading: Icon(Icons.fiber_new),
            title: Text(
              "News",
              softWrap: true,
            ),
          ),
          ListTile(
            title: Text(
              '[2020]: Two papers accepted by INTERSPEECH 2021.',
              softWrap: true,
            ),
          )
        ],
      ),
    );
  }
}