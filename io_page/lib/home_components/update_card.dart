import 'package:flutter/material.dart';
import 'package:zr_jin_page/utilities/error_view.dart';

import 'update_list_tile.dart';
import 'package:zr_jin_page/utilities/futures.dart';

class UpdateCard extends StatelessWidget {
  const UpdateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      ListTile(
          leading: const Icon(Icons.fiber_new),
          title: Text("News", style: Theme.of(context).textTheme.titleMedium!)),
      const Divider(indent: 10),
      FutureBuilder<List<dynamic>>(
          future: futureUpdate(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final items = snapshot.data!;
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: items.length > 5 ? 5 : items.length,
                  itemBuilder: (BuildContext context, int index) =>
                      UpdateEventListTile(json: items[index]));
            } else if (snapshot.hasError) {
              return buildErrorView(context, snapshot.error.toString());
            } else {
              return const Center(child: LinearProgressIndicator());
            }
          })
    ]));
  }
}
