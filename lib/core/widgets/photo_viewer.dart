import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoViewScreen extends StatefulWidget {
  final List<String> imageUrls;
  final int initialIndex;
  final String? heroTag;

  const PhotoViewScreen({
    super.key,
    required this.imageUrls,
    this.initialIndex = 0,
    this.heroTag,
  });

  @override
  State<PhotoViewScreen> createState() => _PhotoViewScreenState();
}

class _PhotoViewScreenState extends State<PhotoViewScreen> {
  late PageController _pageController;
  late int _currentIndex;
  bool _showAppBar = true;

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

  void _toggleAppBar() {
    setState(() {
      _showAppBar = !_showAppBar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: _showAppBar
          ? AppBar(
              backgroundColor: Colors.black.withAlpha(128),
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Text(
                '${_currentIndex + 1} of ${widget.imageUrls.length}',
                style: const TextStyle(color: Colors.white),
              ),
              centerTitle: true,
            )
          : null,
      body: GestureDetector(
        onTap: _toggleAppBar,
        child: PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(widget.imageUrls[index]),
              initialScale: PhotoViewComputedScale.contained,
              minScale: PhotoViewComputedScale.contained * 0.8,
              maxScale: PhotoViewComputedScale.covered * 2.0,
              heroAttributes: widget.heroTag != null
                  ? PhotoViewHeroAttributes(tag: '${widget.heroTag}_$index')
                  : null,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[900],
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: Colors.white,
                          size: 48,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Failed to load image',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          itemCount: widget.imageUrls.length,
          loadingBuilder: (context, event) => Container(
            color: Colors.black,
            child: const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          ),
          backgroundDecoration: const BoxDecoration(color: Colors.black),
          pageController: _pageController,
          onPageChanged: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
      bottomNavigationBar: _showAppBar && widget.imageUrls.length > 1
          ? Container(
              color: Colors.black.withAlpha(128),
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Previous button
                  IconButton(
                    onPressed: _currentIndex > 0
                        ? () {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        : null,
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: _currentIndex > 0 ? Colors.white : Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Dot indicators
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          widget.imageUrls.length,
                          (index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: index == _currentIndex
                                  ? Colors.white
                                  : Colors.white.withAlpha(100),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Next button
                  IconButton(
                    onPressed: _currentIndex < widget.imageUrls.length - 1
                        ? () {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        : null,
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: _currentIndex < widget.imageUrls.length - 1
                          ? Colors.white
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          : null,
    );
  }
}

extension PhotoViewNavigation on BuildContext {
  void openPhotoView({
    required List<String> imageUrls,
    int initialIndex = 0,
    String? heroTag,
  }) {
    Navigator.of(this).push(
      MaterialPageRoute(
        builder: (context) => PhotoViewScreen(
          imageUrls: imageUrls,
          initialIndex: initialIndex,
          heroTag: heroTag,
        ),
      ),
    );
  }
}
