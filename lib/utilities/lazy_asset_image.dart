import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class LazyAssetImage extends StatefulWidget {
  const LazyAssetImage({
    super.key,
    required this.assetName,
    this.fit,
    this.alignment = Alignment.center,
    this.placeholder,
    this.fadeInDuration = const Duration(milliseconds: 250),
  });

  final String assetName;
  final BoxFit? fit;
  final Alignment alignment;
  final Widget? placeholder;
  final Duration fadeInDuration;

  @override
  State<LazyAssetImage> createState() => _LazyAssetImageState();
}

class _LazyAssetImageState extends State<LazyAssetImage> {
  bool _shouldLoad = false;
  bool _hasScheduledCheck = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _maybeLoadOrSchedule();
  }

  @override
  void didUpdateWidget(covariant LazyAssetImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.assetName != widget.assetName && !_shouldLoad) {
      _maybeLoadOrSchedule();
    }
  }

  void _maybeLoadOrSchedule() {
    if (_shouldLoad || !mounted) {
      return;
    }

    if (Scrollable.recommendDeferredLoadingForContext(context)) {
      _scheduleDeferredCheck();
      return;
    }

    setState(() {
      _shouldLoad = true;
    });
  }

  void _scheduleDeferredCheck() {
    if (_hasScheduledCheck) {
      return;
    }
    _hasScheduledCheck = true;
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      _hasScheduledCheck = false;
      _maybeLoadOrSchedule();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_shouldLoad) {
      return widget.placeholder ?? const ColoredBox(color: Colors.black12);
    }

    return Image.asset(
      widget.assetName,
      fit: widget.fit,
      alignment: widget.alignment,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) {
          return child;
        }
        return AnimatedOpacity(
          opacity: frame == null ? 0 : 1,
          duration: widget.fadeInDuration,
          child: child,
        );
      },
    );
  }
}
