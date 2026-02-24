import 'package:flutter/foundation.dart';
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
    this.cacheWidth,
    this.cacheHeight,
    this.filterQuality = FilterQuality.medium,
    this.errorBuilder,
  });

  final String assetName;
  final BoxFit? fit;
  final Alignment alignment;
  final Widget? placeholder;
  final Duration fadeInDuration;
  final int? cacheWidth;
  final int? cacheHeight;
  final FilterQuality filterQuality;
  final ImageErrorWidgetBuilder? errorBuilder;

  @override
  State<LazyAssetImage> createState() => _LazyAssetImageState();
}

class _LazyAssetImageState extends State<LazyAssetImage> {
  bool _shouldLoad = false;
  bool _hasScheduledCheck = false;
  int _deferredFrames = 0;
  late final DisposableBuildContext<State> _imageLoadContext;
  ImageProvider<Object>? _cachedImageProvider;

  @override
  void initState() {
    super.initState();
    _imageLoadContext = DisposableBuildContext<State>(this);
  }

  @override
  void dispose() {
    _imageLoadContext.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _maybeLoadOrSchedule();
  }

  @override
  void didUpdateWidget(covariant LazyAssetImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_didImageConfigChange(oldWidget)) {
      _cachedImageProvider = null;
    }
    if (oldWidget.assetName != widget.assetName && !_shouldLoad) {
      _maybeLoadOrSchedule();
    }
  }

  bool _didImageConfigChange(LazyAssetImage oldWidget) {
    return oldWidget.assetName != widget.assetName ||
        oldWidget.cacheWidth != widget.cacheWidth ||
        oldWidget.cacheHeight != widget.cacheHeight;
  }

  void _maybeLoadOrSchedule() {
    if (_shouldLoad || !mounted) {
      return;
    }

    const maxDeferredFrames = 4;
    final shouldDeferForScroll = Scrollable.recommendDeferredLoadingForContext(
      context,
    );
    final shouldDeferOneWebFrame = kIsWeb && _deferredFrames == 0;
    final canDefer = _deferredFrames < maxDeferredFrames;

    if ((shouldDeferForScroll || shouldDeferOneWebFrame) && canDefer) {
      _deferredFrames += 1;
      _scheduleDeferredCheck();
      return;
    }

    setState(() {
      _shouldLoad = true;
    });
  }

  ImageProvider<Object> _buildImageProvider(BuildContext context) {
    final cachedProvider = _cachedImageProvider;
    if (cachedProvider != null) {
      return cachedProvider;
    }

    final nextProvider = ScrollAwareImageProvider<Object>(
      context: _imageLoadContext,
      imageProvider: ResizeImage.resizeIfNeeded(
        widget.cacheWidth,
        widget.cacheHeight,
        AssetImage(widget.assetName),
      ),
    );
    _cachedImageProvider = nextProvider;
    return nextProvider;
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

    return Image(
      image: _buildImageProvider(context),
      fit: widget.fit,
      alignment: widget.alignment,
      filterQuality: widget.filterQuality,
      errorBuilder: widget.errorBuilder,
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
