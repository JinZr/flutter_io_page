import 'package:flutter/material.dart';

class CardPlaceholder extends StatelessWidget {
  const CardPlaceholder({super.key, this.minHeight = 160});

  final double minHeight;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.surfaceContainerHighest;
    return Card(
      clipBehavior: Clip.hardEdge,
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: minHeight),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withValues(alpha: 0.35),
                color.withValues(alpha: 0.15),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: SizedBox(
                width: 32,
                height: 32,
                child: CircularProgressIndicator(strokeWidth: 2.6),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
