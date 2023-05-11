import 'package:flutter/material.dart';

import 'dataset_view_components/dataset_card.dart';

class DatasetView extends StatefulWidget {
  final String title;

  const DatasetView({Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DatasetViewState();
}

class _DatasetViewState extends State<DatasetView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          DatasetCard(
            name: "CU_DERAIN",
            description: "for real world",
            bibtex: """@inproceedings{pmlr-v70-odena17a,
\ttitle ={{Conditional Image Synthesis with Auxiliary Classifier GANs}},
\tauthor={Augustus Odena and Christopher Olah and Jonathon Shlens},
\tbooktitle={ICML},
\tyear={2017},
}""",
pdfUrl: "",
datasetUrl: "",
publisher: "CVPR",
year: "2022",
          )
        ],
      ),
    );
  }
}
