import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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
  Future<void>? _loadFuture;
  bool _hasScheduledDeferredLoad = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Access to [Scrollable.recommendDeferredLoadingForContext] relies on
    // inherited widgets such as [MediaQuery] being fully initialized. Invoke
    // the loading logic from here so we avoid depending on inherited elements
    // during [initState], which can trigger framework assertions.
    _maybeLoadOrSchedule();
  }

  @override
  void didUpdateWidget(covariant DeferredWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.libraryLoader != widget.libraryLoader && _loadFuture == null) {
      _maybeLoadOrSchedule();
    }
  }

  void _maybeLoadOrSchedule() {
    if (_loadFuture != null || !mounted) {
      return;
    }

    if (Scrollable.recommendDeferredLoadingForContext(context)) {
      _scheduleDeferredCheck();
      return;
    }

    setState(() {
      _loadFuture = widget.libraryLoader();
    });
  }

  void _scheduleDeferredCheck() {
    if (_hasScheduledDeferredLoad) {
      return;
    }
    _hasScheduledDeferredLoad = true;
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      _hasScheduledDeferredLoad = false;
      _maybeLoadOrSchedule();
    });
  }

  @override
  Widget build(BuildContext context) {
    final future = _loadFuture;
    if (future == null) {
      return widget.placeholder ?? const SizedBox.shrink();
    }

    return FutureBuilder<void>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return widget.builder(context);
        }
        return widget.placeholder ?? const SizedBox.shrink();
      },
    );
  }
}
