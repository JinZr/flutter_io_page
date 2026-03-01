import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DeferredWidget extends StatefulWidget {
  const DeferredWidget({
    super.key,
    required this.libraryLoader,
    required this.builder,
    this.placeholder,
    this.webDeferByFrame = true,
    this.maxDeferralFrames = 4,
    this.minPlaceholderDuration = const Duration(milliseconds: 120),
  }) : assert(maxDeferralFrames >= 0);

  final bool webDeferByFrame;
  final int maxDeferralFrames;
  final Duration minPlaceholderDuration;

  final Future<void> Function() libraryLoader;
  final WidgetBuilder builder;
  final Widget? placeholder;

  @override
  State<DeferredWidget> createState() => _DeferredWidgetState();
}

class _DeferredWidgetState extends State<DeferredWidget> {
  Future<void>? _loadFuture;
  bool _hasScheduledDeferredLoad = false;
  int _deferralFrameCount = 0;
  DateTime? _placeholderShownAt;

  @override
  void initState() {
    super.initState();
    _placeholderShownAt = DateTime.now();
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
    if (oldWidget.libraryLoader != widget.libraryLoader &&
        _loadFuture == null) {
      _loadFuture = null;
      _deferralFrameCount = 0;
      _placeholderShownAt = DateTime.now();
      _maybeLoadOrSchedule();
    }
  }

  void _maybeLoadOrSchedule() {
    if (_loadFuture != null || !mounted) {
      return;
    }

    final shouldDeferForScroll = Scrollable.recommendDeferredLoadingForContext(
      context,
    );
    final shouldDeferOneWebFrame =
        kIsWeb && widget.webDeferByFrame && _deferralFrameCount == 0;
    final canDeferMore = _deferralFrameCount < widget.maxDeferralFrames;

    if ((shouldDeferForScroll || shouldDeferOneWebFrame) && canDeferMore) {
      _deferralFrameCount += 1;
      _scheduleDeferredCheck();
      return;
    }

    _placeholderShownAt ??= DateTime.now();
    final loadFuture = widget.libraryLoader().then((_) async {
      final shownAt = _placeholderShownAt;
      final minDuration = widget.minPlaceholderDuration;
      if (shownAt == null || minDuration <= Duration.zero) {
        return;
      }
      final elapsed = DateTime.now().difference(shownAt);
      final remaining = minDuration - elapsed;
      if (remaining > Duration.zero) {
        await Future<void>.delayed(remaining);
      }
    });
    setState(() {
      _loadFuture = loadFuture;
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
        if (snapshot.connectionState == ConnectionState.done &&
            !snapshot.hasError) {
          return widget.builder(context);
        }
        return widget.placeholder ?? const SizedBox.shrink();
      },
    );
  }
}
