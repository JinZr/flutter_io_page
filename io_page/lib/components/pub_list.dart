import 'package:flutter/material.dart';

class PublicationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ListTile(
            leading: Icon(Icons.book),
            title: Text(
              "Publication",
              softWrap: true,
            ),
          ),
          ListTile(
            title: const Text(
              '[INTERSPEECH 2021]: Adversarial Data Augmentation for Disordered Speech Recognition',
              softWrap: true,
            ),
            subtitle: Text(
              "Zengrui Jin, Mengzhe Geng, Xurong Xie, Jianwei Yu, Shansong Liu, Xunying Liu, Helen Meng",
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          ListTile(
            title: const Text(
              '[INTERSPEECH 2021]: Spectro-Temporal Deep Features for Disordered Speech Assessment and Recognition',
              softWrap: true,
            ),
            subtitle: Text(
              "Mengzhe Geng, Shansong Liu, Jianwei Yu, Xurong Xie, Shoukang Hu, Zi Ye, Zengrui Jin, Xunying Liu, Helen Meng",
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          )
        ],
      ),
    );
  }
}
