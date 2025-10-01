import 'package:flutter/material.dart';

class DeferredWidget extends StatefulWidget {
  const DeferredWidget({
    super.key,
    required this.libraryLoader,
    required this.builder,
    this.placeholder,
  });

  final Future<void> Function() libraryLoader;
  final WidgetBuilder builder;
  final Widget? placeholder;

  @override
  State<DeferredWidget> createState() => _DeferredWidgetState();
}

class _DeferredWidgetState extends State<DeferredWidget> {
  late final Future<void> _loadFuture = widget.libraryLoader();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _loadFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return widget.builder(context);
        }
        return widget.placeholder ?? const SizedBox.shrink();
      },
    );
  }
}
