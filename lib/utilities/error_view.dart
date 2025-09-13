import 'package:flutter/material.dart';

Widget buildErrorView(BuildContext context, String error) =>
    Center(child: Column(children: [const Icon(Icons.warning), Text(error)]));
