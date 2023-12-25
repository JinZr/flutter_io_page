import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String str;

  const CustomChip({super.key, required this.str});

  @override
  Widget build(BuildContext context) => Chip(
      label: Text(str),
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      side: BorderSide(
          color: Theme.of(context).colorScheme.secondaryContainer, width: 0.0));
}
