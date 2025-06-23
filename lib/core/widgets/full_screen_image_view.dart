import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/widgets/cached_image.dart';

class FullScreenImageView extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const FullScreenImageView({
    super.key,
    required this.images,
    required this.initialIndex,
  });

  @override
  State<FullScreenImageView> createState() => _FullScreenImageViewState();
}

class _FullScreenImageViewState extends State<FullScreenImageView>
    with TickerProviderStateMixin {
  late PageController _pageController;
  int _currentIndex = 0;
  bool _showAppBar = true;

  // Dismiss gesture variables
  double _verticalOffset = 0;
  double _opacity = 1.0;
  bool _isDismissing = false;
  bool _isZoomed = false;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onVerticalDragStart(DragStartDetails details) {
    if (!_isZoomed) {
      _isDismissing = true;
    }
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    if (_isDismissing && !_isZoomed) {
      setState(() {
        _verticalOffset += details.delta.dy;
        double progress = (_verticalOffset.abs() / 200).clamp(0.0, 1.0);
        _opacity = 1.0 - (progress * 0.8);
      });
    }
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    if (_isDismissing) {
      bool shouldDismiss =
          _verticalOffset.abs() > 80 ||
          details.velocity.pixelsPerSecond.dy.abs() > 500;

      if (shouldDismiss) {
        context.pop();
      } else {
        setState(() {
          _verticalOffset = 0;
          _opacity = 1.0;
        });
      }
      _isDismissing = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withAlpha(255 * (1 - _opacity).round()),
      extendBodyBehindAppBar: true,
      appBar: _showAppBar
          ? AppBar(
              backgroundColor: Colors.black.withAlpha(128),
              foregroundColor: Colors.white,
              elevation: 0,
              centerTitle: false,
              title: Text(
                '${_currentIndex + 1} of ${widget.images.length}',
                style: context.titleMedium.copyWith(color: Colors.white),
              ),
            )
          : null,
      body: GestureDetector(
        onVerticalDragStart: _onVerticalDragStart,
        onVerticalDragUpdate: _onVerticalDragUpdate,
        onVerticalDragEnd: _onVerticalDragEnd,
        child: Transform.translate(
          offset: Offset(0, _verticalOffset),
          child: PhotoViewGallery.builder(
            itemCount: widget.images.length,
            pageController: _pageController,
            scrollPhysics: BouncingScrollPhysics(),
            backgroundDecoration: BoxDecoration(color: Colors.black),
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            builder: (context, index) {
              return PhotoViewGalleryPageOptions.customChild(
                child: _ZoomTrackingPhotoView(
                  imageUrl: widget.images[index],
                  heroTag: 'image_$index',
                  onZoomChanged: (isZoomed) {
                    setState(() {
                      _isZoomed = isZoomed;
                    });
                  },
                  onTap: () {
                    setState(() {
                      _showAppBar = !_showAppBar;
                    });
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ZoomTrackingPhotoView extends StatefulWidget {
  final String imageUrl;
  final String heroTag;
  final Function(bool) onZoomChanged;
  final VoidCallback onTap;

  const _ZoomTrackingPhotoView({
    required this.imageUrl,
    required this.heroTag,
    required this.onZoomChanged,
    required this.onTap,
  });

  @override
  State<_ZoomTrackingPhotoView> createState() => _ZoomTrackingPhotoViewState();
}

class _ZoomTrackingPhotoViewState extends State<_ZoomTrackingPhotoView> {
  late PhotoViewController _photoViewController;
  bool _isZoomed = false;

  @override
  void initState() {
    super.initState();
    _photoViewController = PhotoViewController();
    _photoViewController.outputStateStream.listen((
      PhotoViewControllerValue value,
    ) {
      bool wasZoomed = _isZoomed;
      _isZoomed = (value.scale ?? 1.0) > 1.1;

      if (wasZoomed != _isZoomed) {
        widget.onZoomChanged(_isZoomed);
      }
    });
  }

  @override
  void dispose() {
    _photoViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _isZoomed ? null : widget.onTap,
      onDoubleTap: () {
        if (_isZoomed) {
          _photoViewController.reset();
        } else {
          _photoViewController.scale = 2.0;
        }
      },
      child: PhotoView.customChild(
        controller: _photoViewController,
        minScale: PhotoViewComputedScale.contained * 0.8,
        maxScale: PhotoViewComputedScale.covered * 4.0,
        initialScale: PhotoViewComputedScale.contained,
        heroAttributes: PhotoViewHeroAttributes(tag: widget.heroTag),
        enableRotation: false,
        backgroundDecoration: BoxDecoration(color: Colors.black),
        child: CachedImage(url: widget.imageUrl, fit: BoxFit.contain),
      ),
    );
  }
}
