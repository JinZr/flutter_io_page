import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class DatasetCard extends StatelessWidget {
  final String name;
  final String description;
  final String bibtex;
  final String pdfUrl;
  final String datasetUrl;
  final String publisher;
  final String year;
  const DatasetCard(
      {Key? key,
      required this.name,
      required this.description,
      required this.bibtex,
      required this.pdfUrl,
      required this.datasetUrl,
      required this.publisher,
      required this.year})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: SelectableText(name),
            subtitle: SelectableText(description),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SelectableText(bibtex, style: GoogleFonts.robotoMono()),
          ),
          const Divider(indent: 10),
          Row(
            children: [
              ButtonBar(
                children: [
                  Chip(
                    label: Text(
                      publisher,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.surface,
                  ),
                  Chip(
                    label: Text(
                      year,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.surface,
                  ),
                ],
              ),
              const Spacer(
                flex: 2,
              ),
              ButtonBar(
                children: [
                  TextButton(
                      onPressed: () {}, child: const Text("COPY BIBTEX")),
                  TextButton(
                      onPressed: () {}, child: const Text("DOWNLOAD PAPER")),
                  ElevatedButton(
                      onPressed: () {}, child: const Text("DOWNLOAD DATASET")),
                ],
              )
            ],
          ),
        ],
      )),
    );
  }
}
