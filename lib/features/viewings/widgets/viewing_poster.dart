import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/widgets/cached_image.dart';
import 'package:viewing_nz/core/widgets/photo_viewer.dart';

class ViewingPoster extends StatefulWidget {
  const ViewingPoster({super.key});

  @override
  State<ViewingPoster> createState() => _ViewingPosterState();
}

class _ViewingPosterState extends State<ViewingPoster> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _currentIndex = 0;
  bool _showArrows = false; // Track arrow visibility

  final List<String> samplePropertyImages = [
    "https://images.pexels.com/photos/280222/pexels-photo-280222.jpeg?auto=compress&cs=tinysrgb&w=400",
    "https://images.pexels.com/photos/280222/pexels-photo-280222.jpeg?auto=compress&cs=tinysrgb&w=400",
    "https://images.pexels.com/photos/280222/pexels-photo-280222.jpeg?auto=compress&cs=tinysrgb&w=400",
    "https://images.pexels.com/photos/280222/pexels-photo-280222.jpeg?auto=compress&cs=tinysrgb&w=400",
    "https://images.pexels.com/photos/280222/pexels-photo-280222.jpeg?auto=compress&cs=tinysrgb&w=400",
  ];

  void _toggleArrows() {
    setState(() {
      _showArrows = !_showArrows;
    });
  }

  void _openPhotoView() {
    // Using the extension method
    context.openPhotoView(
      imageUrls: samplePropertyImages,
      initialIndex: _currentIndex,
      heroTag: 'viewing_poster',
    );

    // Alternative direct navigation:
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => PhotoViewScreen(
    //       imageUrls: samplePropertyImages,
    //       initialIndex: _currentIndex,
    //       heroTag: 'viewing_poster',
    //     ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: GestureDetector(
        onTap: _toggleArrows,
        child: Stack(
          children: [
            CarouselSlider.builder(
              carouselController: _controller,
              itemCount: samplePropertyImages.length,
              itemBuilder: (context, index, realIndex) {
                return CachedImage(url: samplePropertyImages[index]);
              },
              options: CarouselOptions(
                aspectRatio: 8 / 7,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                enlargeCenterPage: false,
                autoPlay: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            // Left Arrow with animation
            Positioned(
              left: 16,
              bottom: 16,
              child: AnimatedOpacity(
                opacity: (_showArrows && _currentIndex > 0) ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: _buildSliderIcon(SolarIcons.altArrowLeft, () {
                  if (_showArrows && _currentIndex > 0) {
                    _controller.previousPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.fastOutSlowIn,
                    );
                  }
                }),
              ),
            ),
            // Right Arrow with animation
            Positioned(
              right: 16,
              bottom: 16,
              child: AnimatedOpacity(
                opacity:
                    (_showArrows &&
                        _currentIndex < samplePropertyImages.length - 1)
                    ? 1.0
                    : 0.0,
                duration: const Duration(milliseconds: 200),
                child: _buildSliderIcon(SolarIcons.altArrowRight, () {
                  if (_showArrows &&
                      _currentIndex < samplePropertyImages.length - 1) {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.fastOutSlowIn,
                    );
                  }
                }),
              ),
            ),
            Positioned(
              right: 16,
              top: 16,
              child: AnimatedOpacity(
                opacity: (_showArrows) ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: _buildSliderIcon(
                  SolarIcons.squareTopDown,
                  _openPhotoView,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildSliderIcon(SvgIconData icon, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.white),
      child: IconButton(
        icon: SvgIcon(icon, color: AppColors.gunmetal600),
        visualDensity: VisualDensity.compact,
        onPressed: onPressed,
      ),
    );
  }
}
