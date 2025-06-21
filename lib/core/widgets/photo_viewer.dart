import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';

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

  // double currentRotation = 0;
  // final PhotoViewController _controller = PhotoViewController();

  // void rotateImage() {
  //   setState(() {
  //     currentRotation += 0.5 * 3.1415926535; // rotate 90°
  //   });
  //   _controller.rotation = currentRotation;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pureBlack,
      extendBodyBehindAppBar: true,
      appBar: _showAppBar
          ? AppBar(
              backgroundColor: AppColors.pureBlack,
              elevation: 0,
              leading: IconButton(
                icon: const SvgIcon(
                  SolarIcons.closeCircle,
                  color: AppColors.white,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),

              title: Text(
                '${_currentIndex + 1} of ${widget.imageUrls.length}',
                style: context.titleMedium.copyWith(
                  color: AppColors.gray50,
                  fontWeight: FontWeight.w600,
                ),
              ),
              centerTitle: true,
              actions: [
                // IconButton(
                //   icon: const SvgIcon(
                //     SolarIcons.altArrowLeft,
                //     color: AppColors.white,
                //   ),
                //   onPressed: rotateImage,
                // ),
              ],
            )
          : null,
      body: GestureDetector(
        onTap: _toggleAppBar,
        child: PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              // controller: _controller,
              imageProvider: NetworkImage(widget.imageUrls[index]),
              initialScale: PhotoViewComputedScale.contained,
              minScale: PhotoViewComputedScale.contained * 0.8,
              maxScale: PhotoViewComputedScale.covered * 2.0,
              heroAttributes: widget.heroTag != null
                  ? PhotoViewHeroAttributes(tag: '${widget.heroTag}_$index')
                  : null,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: AppColors.pureBlack,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgIcon(
                          SolarIcons.infoCircle,
                          color: AppColors.white,
                          size: 48,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Failed to load image',
                          style: context.bodyMedium.copyWith(
                            color: AppColors.white,
                          ),
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
            color: AppColors.pureBlack,
            child: const Center(
              child: CircularProgressIndicator(color: AppColors.white),
            ),
          ),
          backgroundDecoration: const BoxDecoration(color: AppColors.pureBlack),
          pageController: _pageController,
          onPageChanged: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
      bottomNavigationBar: Container(
        color: AppColors.pureBlack,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          top: false,
          child: _showAppBar && widget.imageUrls.length > 1
              ? Row(
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
                      icon: SvgIcon(
                        SolarIcons.altArrowLeft,
                        color: _currentIndex > 0
                            ? AppColors.white
                            : AppColors.gray800,
                      ),
                    ),
                    const Gap(16),
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
                                    ? AppColors.white
                                    : AppColors.gray800,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Gap(16),
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
                      icon: SvgIcon(
                        SolarIcons.altArrowRight,
                        color: _currentIndex < widget.imageUrls.length - 1
                            ? AppColors.white
                            : AppColors.gray800,
                      ),
                    ),
                  ],
                )
              : SizedBox(),
        ),
      ),
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
