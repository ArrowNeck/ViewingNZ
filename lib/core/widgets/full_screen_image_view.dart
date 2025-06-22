import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viewing_nz/core/widgets/cached_image.dart';

class FullScreenImageView extends StatefulWidget {
  final int currentIndex;
  final List<String> images;

  const FullScreenImageView({
    super.key,
    required this.currentIndex,
    required this.images,
  });

  @override
  State<FullScreenImageView> createState() => _FullScreenImageViewState();
}

class _FullScreenImageViewState extends State<FullScreenImageView>
    with TickerProviderStateMixin {
  late PageController _pageController;
  late int _currentIndex;
  bool _showAppBar = true;
  double _dragDistance = 0;
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
    _pageController = PageController(initialPage: widget.currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _toggleAppBar() {
    setState(() {
      _showAppBar = !_showAppBar;
    });
  }

  void _handleVerticalDragStart(DragStartDetails details) {
    _isDragging = true;
  }

  void _handleVerticalDragUpdate(DragUpdateDetails details) {
    if (_isDragging) {
      setState(() {
        _dragDistance += details.delta.dy;
      });
    }
  }

  void _handleVerticalDragEnd(DragEndDetails details) {
    if (_isDragging) {
      if (_dragDistance.abs() > 150) {
        context.pop();
      } else {
        setState(() {
          _dragDistance = 0;
        });
      }
      _isDragging = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: _showAppBar
          ? AppBar(
              backgroundColor: Colors.black.withAlpha(128),
              foregroundColor: Colors.white,
              title: Text('${_currentIndex + 1} of ${widget.images.length}'),
              actions: [
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Share functionality')),
                    );
                  },
                ),
              ],
            )
          : null,
      body: GestureDetector(
        onVerticalDragStart: _handleVerticalDragStart,
        onVerticalDragUpdate: _handleVerticalDragUpdate,
        onVerticalDragEnd: _handleVerticalDragEnd,
        child: Transform.translate(
          offset: Offset(0, _dragDistance),
          child: Container(
            color: Colors.black.withAlpha(
              (255 * (_dragDistance.abs() / 300).clamp(0, 0.7)).round(),
            ),
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemCount: widget.images.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: _toggleAppBar,
                      child: Center(
                        child: Hero(
                          tag: 'list_image_$index',
                          // transitionOnUserGestures: true,
                          child: RepaintBoundary(
                            child: InteractiveViewer(
                              minScale: 0.5,
                              maxScale: 4.0,
                              child: CachedImage(
                                url: widget.images[index],
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
